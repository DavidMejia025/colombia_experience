# == Schema Information
#
# Table name: service_costs
#
#  id         :bigint           not null, primary key
#  services   :integer          default("1")
#  pax        :integer          default("7")
#  quote_id   :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  option_id  :integer
#  price_id   :integer
#
require 'test_helper'

class ServiceCostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
