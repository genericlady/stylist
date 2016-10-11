class Location < ApplicationRecord
  belongs_to :user

  def to_string
    full_address + city_state
  end
  
  private
  def full_address
    [ address1, address2 ].compact.join(' ') + ', '
  end
  
  def city_state 
    [ city, state ].join(', ')
  end
end
