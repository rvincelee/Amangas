class Genre < ApplicationRecord
  has_and_belongs_to_many :mangas
  validates :name, presence: true
end
