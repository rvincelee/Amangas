class Province < ApplicationRecord
  has_many :addresses
  validates :name, :abbreviation, presence: true
  validates :HST, :GST, :PST, presence: true, numericality: true, allow_nil: true
end
