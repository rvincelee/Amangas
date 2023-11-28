class Manga < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_one_attached :image
  validates :price, presence: true, numericality: true
  validates :title, :publish_date, :status, :description, presence: true
end
