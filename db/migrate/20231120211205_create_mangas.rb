class CreateMangas < ActiveRecord::Migration[7.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.decimal :price
      t.float :score
      t.date :publish_date
      t.string :image
      t.string :status
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
