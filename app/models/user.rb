class User < ApplicationRecord
  enum role: [:normal, :provider, :admin]
  include PgSearch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :identification, 
                     styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/images/missing-image.png",
                     storage: :s3,
                     s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment_content_type :identification, content_type: /\Aimage\/.*\z/

  has_attached_file :selfie, 
                     styles: { medium: "300x300>", thumb: "100x100>" },
                     default_url: "/images/missing-image.png",
                     storage: :s3,
                     s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment_content_type :selfie, content_type: /\Aimage\/.*\z/


  has_many :licenses
  has_many :locations
  has_many :services
  
  accepts_nested_attributes_for :locations, :services, :licenses

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

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :zipcode, presence: true
  validates :zipcode, length: { in: 5..10 }
  validates :zipcode, format: { with: /\d{5}-\d{4}|\d{9}|\d{5}/ }

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

  def guest?
    persisted?
  end

end
