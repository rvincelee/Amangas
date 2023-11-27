class Order < ApplicationRecord
  belongs_to :user
  validates :total, presence: true, numericality: true
  validates :date, presence: true
end
