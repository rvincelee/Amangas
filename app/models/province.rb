class Province < ApplicationRecord
  has_many :addresses
  validates :name, :abbreviation, :PST, :GST, :HST, presence: true
end
