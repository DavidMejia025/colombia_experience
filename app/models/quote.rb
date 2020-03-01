class Quote < ApplicationRecord
  has_and_belongs_to_many :cities
  has_many :tour_costs
  has_many :tours, through: :tour_costs
  has_many :service_costs
  has_many :services, through: :service_costs
  has_many :options
  has_many :prices
end
