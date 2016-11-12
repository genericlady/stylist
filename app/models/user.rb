class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :locations

  include PgSearch

  pg_search_scope :search_by_full_name,
                  :against => [:first_name, :last_name],
                  :using   => {
                    :tsearch => { :prefix => true }
                  }
end
