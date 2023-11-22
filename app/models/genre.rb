class Genre < ApplicationRecord
  belongs_to :manga
  has_many :genre
end
