class CreateMangaGenresJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :genres_mangas, id: false do |t|
      t.belongs_to :genre
      t.belongs_to :manga
    end

    add_index :genres_mangas, %i[genre_id manga_id], unique: true
  end
end
