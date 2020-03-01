class Tour < ApplicationRecord
  has_many :tour_costs
  has_many :quotes, through: :tour_costs

  belongs_to :city
end
