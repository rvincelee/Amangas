class Author < ApplicationRecord
  has_many :manga
  validates :name, presence: true
end
