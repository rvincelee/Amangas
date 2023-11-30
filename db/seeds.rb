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
Province.delete_all

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

response = RestClient.get("https://api.jikan.moe/v4/genres/manga")

genres_data = JSON.parse(response.body)

genres_data["data"].each do |genre|
  Genre.find_or_create_by(name: genre["name"])
end

sleep(1)

response = RestClient.get("https://api.jikan.moe/v4/manga?score>9.01")

manga_data = JSON.parse(response.body)

manga_data["data"].each do |manga|
  day = manga["published"]["prop"]["from"]["day"]
  month = manga["published"]["prop"]["from"]["month"]
  year = manga["published"]["prop"]["from"]["year"]

  author = Author.find_or_create_by(name: manga["authors"][0]["name"])

  manga_instance = author.manga.find_or_create_by(
    title:        manga["title_english"],
    description:  manga["synopsis"],
    score:        manga["score"],
    price:        Faker::Commerce.price(range: 7.99..12.99),
    publish_date: Date.new(year, month, day),
    status:       manga["status"]
  )
  download_image = URI.parse(manga["images"]["webp"]["image_url"]).open
  manga_instance.image.attach(io:       download_image,
                              filename: "#{manga['title_english']}.webp")

  next unless manga_instance.valid?

  manga["genres"].each do |genre_data|
    genre = Genre.find_by(name: genre_data["name"])
    genre.mangas << manga_instance if !manga_instance.genres.exists?(genre.id) && manga_instance
  end

  sleep(1)
end

provinces = [{ name: "Alberta", abbreviation: "AB", PST: nil, GST: 0.05, HST: nil },
             { name: "British Columbia", abbreviation: "BC", PST: 0.07, GST: 0.05, HST: nil },
             { name: "Manitoba", abbreviation: "MB", PST: 0.07, GST: 0.05, HST: nil },
             { name: "New Brunswick", abbreviation: "AB", PST: nil, GST: nil, HST: 0.15 },
             { name: "Newfoundland and Labrador", abbreviation: "NL", PST: nil, GST: nil,
 HST: 0.15 },
             { name: "Northwest Territories", abbreviation: "NT", PST: nil, GST: 0.05, HST: nil },
             { name: "Nova Scotia", abbreviation: "NS", PST: nil, GST: nil, HST: 0.15 },
             { name: "Nunavut", abbreviation: "NU", PST: nil, GST: 0.05, HST: nil },
             { name: "Ontario", abbreviation: "ON", PST: nil, GST: nil, HST: 0.13 },
             { name: "Prince Edward Island", abbreviation: "PE", PST: nil, GST: nil, HST: 0.15 },
             { name: "Quebec", abbreviation: "QC", PST: 0.09975, GST: 0.05, HST: nil },
             { name: "Saskatchewan", abbreviation: "SK", PST: 0.06, GST: 0.05, HST: nil },
             { name: "Yukon", abbreviation: "YT", PST: nil, GST: 0.05, HST: nil }]

provinces.each do |province|
  prov = Province.find_or_create_by(
    name:         province[:name],
    abbreviation: province[:abbreviation],
    PST:          province[:PST],
    GST:          province[:GST],
    HST:          province[:HST]
  )
  puts(prov)
end
