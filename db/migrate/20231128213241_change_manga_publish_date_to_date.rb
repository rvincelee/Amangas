class ChangeMangaPublishDateToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :mangas, :publish_date, :date
  end
end
