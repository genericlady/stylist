class Location < ApplicationRecord
  has_one :address
  belongs_to :locatable, polymorphic: true, optional: true
end
