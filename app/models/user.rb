class User < ApplicationRecord
  has_many :orders
  validates :first_name, :last_name, :username, :email, :phone, :password, presence: true
end
