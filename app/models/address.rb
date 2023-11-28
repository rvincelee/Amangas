class Address < ApplicationRecord
  belongs_to :province
  validates :street, :city, :postal_code, :province_id, presence: true
end
