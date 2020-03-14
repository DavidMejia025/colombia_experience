# == Schema Information
#
# Table name: vendors
#
#  id          :bigint           not null, primary key
#  name        :string
#  email       :string           default("exito@aol.com")
#  phone       :integer          default("123456789")
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
