class Page < ApplicationRecord
  validates :name, :content, presence: true
end
