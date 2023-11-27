class ChangeMangaPublishDateTypeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :mangas, :publish_date, :string
  end
end
