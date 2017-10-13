class Address < ApplicationRecord
  belongs_to :object, polymorphic: true
  has_many :bookings
end
