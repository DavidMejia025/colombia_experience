# == Schema Information
#
# Table name: prices
#
#  id         :bigint           not null, primary key
#  capacity   :integer          default("1000")
#  value      :integer          default("10")
#  option_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Price < ApplicationRecord
  has_many :service_costs
  has_many :quotes, through: :service_costs
  belongs_to :option
end
