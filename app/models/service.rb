class Service < ApplicationRecord
  has_and_belongs_to_many :tour

  has_many :service_cost
  has_many :quotes, through: :service_costs

  has_many :options

  belongs_to :city
  belongs_to :vendor
end
