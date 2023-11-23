class Manga < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genre
  has_one_attached :image
end
