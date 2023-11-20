class OrderDetail < ApplicationRecord
  belongs_to :manga
  belongs_to :order
end
