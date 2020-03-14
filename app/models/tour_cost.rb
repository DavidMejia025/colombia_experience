# == Schema Information
#
# Table name: tour_costs
#
#  id         :bigint           not null, primary key
#  pax        :integer          default("7")
#  quote_id   :integer
#  tour_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TourCost < ApplicationRecord
  belongs_to :quote
  belongs_to :tour
end
