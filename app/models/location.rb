class Location < ApplicationRecord
  include PgSearch

  belongs_to :user

  pg_search_scope :search,
                  :against => [:address1, :address2, :city, :state],
                  :using   => {
                    :tsearch => { :prefix => true }
                  }

  pg_search_scope :stylist_name_search,
                  :against => [:address1, :address2, :city, :state],
                  :using   => {
                    :tsearch => { :prefix => true }
                  }, 
                  :associated_against => {
                    :user => [:first_name, :last_name]
                  }

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
