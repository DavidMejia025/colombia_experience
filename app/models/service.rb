# == Schema Information
#
# Table name: services
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  vendor_id   :integer
#  city_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Service < ApplicationRecord
  has_and_belongs_to_many :tour

  has_many :service_cost
  has_many :quotes, through: :service_costs

  has_many :options

  belongs_to :city
  belongs_to :vendor
end
