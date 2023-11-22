class Genre < ApplicationRecord
  belongs_to :manga
  has_and_belongs_to_many :manga
end
