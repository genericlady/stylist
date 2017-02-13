class User < ApplicationRecord
  include PgSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations
  has_many :services
  
  accepts_nested_attributes_for :locations, :services

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

  def create_service(service)
    self.services.create(service)
  end

  def self.search(query)
    if query.empty?
      top20
    elsif query.location.empty?
      search_by_name(query.to_string)
    else
      search_by_name_and_location(query.to_string)
    end
  end

  def self.top20
    User.all.limit(20)
  end

  def print_name
    "foo foo"
  end

  def url
    ""
  end

  def avatar_image_name
    ""
  end

  def full_name
    first_name + " " + last_name
  end
end
