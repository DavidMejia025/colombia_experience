class Vendor < ApplicationRecord
  has_and_belongs_to_many :cities
  belongs_to :category
  has_many :services
end
