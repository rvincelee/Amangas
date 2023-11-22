class Manga < ApplicationRecord
  belongs_to :author
  has_many_and_belongs_to_many :genre
end
