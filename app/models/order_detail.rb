class OrderDetail < ApplicationRecord
  belongs_to :manga
  belongs_to :order
  validates :quantity, presence: true, numericality: true
end
