class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :locations

  include PgSearch

  pg_search_scope :search,
                  :against => [:first_name, :last_name],
                  :using   => {
                    :tsearch => { :prefix => true }
                  },
                  :associated_against => {
                    :locations => [:city, :state]
                  }


  def self.query(terms, page_size, page)
    search(terms).includes(:locations)
  end
end
