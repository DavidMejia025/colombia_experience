# == Schema Information
#
# Table name: tours
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string           default("This is a wonderful tour in Colombia Yeiii")
#  city_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Tour < ApplicationRecord
  has_many :tour_costs
  has_many :quotes, through: :tour_costs
  has_and_belongs_to_many :services
  belongs_to :city
end
  
