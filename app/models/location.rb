class Location < ApplicationRecord
  has_one :address
  belongs_to :locatable, polymorphic: true, optional: true
  
  def to_string
    "#{address.line1}, #{address.line2}, #{address.city}, #{address.state}"
  end
end
