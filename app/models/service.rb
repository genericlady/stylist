class Service < ActiveRecord::Base
  include PgSearch

  belongs_to :user
  has_many :locations, through: :user
  validates :name, :description, :price, presence: true

  pg_search_scope :search_by_name_and_description,
                   against: [:name, :description],
                   using: {
                     tsearch: { prefix: true } 
                   },
                  associated_against: {
                    locations: [:city, :state],
                   }

  def self.search(query)
    return top20 if query.empty?
    search_by_name_and_description(query.to_string)
  end

  def self.top20
    Service.all.limit(20)
  end
end
