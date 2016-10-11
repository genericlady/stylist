class Location < ApplicationRecord
  belongs_to :user

  def to_string
    "#{address1}, #{address2}, #{city}, #{state}"
  end
end
