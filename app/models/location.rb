class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true, optional: true
  
  def to_string
    "#{address1}, #{address2}, #{city}, #{state}"
  end
end
