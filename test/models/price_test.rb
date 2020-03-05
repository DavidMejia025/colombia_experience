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
require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
