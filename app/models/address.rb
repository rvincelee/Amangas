class Address < ApplicationRecord
  belongs_to :province
  belongs_to :user, optional: true
  validates :street, :city, :postal_code, :province_id, presence: true
end
