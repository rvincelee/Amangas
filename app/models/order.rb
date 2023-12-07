class Order < ApplicationRecord
  belongs_to :user, optional: true
  validates :total, presence: true, numericality: true
  validates :date, presence: true
end
