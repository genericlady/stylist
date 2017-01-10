class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :locations
  accepts_nested_attributes_for :locations

  include PgSearch

  pg_search_scope :search_by_name,
                  :against => [:first_name, :last_name],
                  :using   => {
                    :tsearch => { :prefix => true }
                  }

 pg_search_scope :search_by_name_and_location,
                   against: [:first_name, :last_name],
                   using: {
                     tsearch: { prefix: true } 
                   },
                   associated_against: {
                     locations: [:city, :state]
                   }


  def print_locations
    cities_and_states = locations.map do |l|
      l.city + " " + l.state
    end
    cities_and_states.join(' | ')
  end
end
