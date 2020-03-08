# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  client     :string           default("Operador NYC")
#  trm        :integer          default("3235")
#  margin     :integer          default("24")
#  currency   :string           default("COP")
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  has_and_belongs_to_many :cities
  has_many :tour_costs
  has_many :tours, through: :tour_costs
  has_many :service_costs
  has_many :services, through: :service_costs
  has_and_belongs_to_many :options
  has_and_belongs_to_many :prices
end
