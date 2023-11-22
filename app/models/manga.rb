class Manga < ApplicationRecord
  belongs_to :author
  has_many :genre
end
