class Salon < ApplicationRecord
  has_many :locations, as: :locatable
end
