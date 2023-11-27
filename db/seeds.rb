require "rest-client"
require "json"
require "faker"

AdminUser.delete_all
OrderDetail.delete_all
Order.delete_all
Manga.delete_all
User.delete_all
Author.delete_all
Genre.delete_all

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

response = RestClient.get("https://api.jikan.moe/v4/genres/manga")

genres_data = JSON.parse(response.body)

genres_data["data"].each do |genre|
  Genre.find_or_create_by(name: genre["name"])
end

response = RestClient.get("https://api.jikan.moe/v4/manga?score>9.01")

manga_data = JSON.parse(response.body)

manga_data["data"].each do |manga|
  day = manga["published"]["prop"]["from"]["day"]
  month = manga["published"]["prop"]["from"]["month"]
  year = manga["published"]["prop"]["from"]["year"]

  author = Author.find_or_create_by(name: manga["authors"][0]["name"]) do |auth|
    auth.name = manga["authors"][0]["name"]
  end

  image_bytes = response.headers[:content_length].to_i
  image_url = manga["images"]["webp"]["image_url"]
  image_blob = ActiveStorage::Blob.create_before_direct_upload!(
    filename:  "manga_image.webp",
    byte_size: image_bytes,
    checksum:  Digest::MD5.base64digest(image_url)
  )

  manga_instance = author.manga.find_or_create_by(
    title:        manga["title_english"],
    description:  manga["synopsis"],
    score:        manga["score"],
    price:        Faker::Commerce.price(range: 7.99..12.99),
    publish_date: "#{day} #{month}, #{year}",
    status:       manga["status"]
  )

  next unless manga_instance.valid?

  manga_instance.image.attach(image_blob)

  manga["genres"].each do |genre_data|
    genre = Genre.find_by(name: genre_data["name"])

    genre.mangas << manga_instance if !manga_instance.genres.exists?(genre.id) && manga_instance
  end
end
