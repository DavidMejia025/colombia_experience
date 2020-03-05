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
require 'test_helper'

class TourTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
