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
require 'test_helper'

class TourCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
