# == Schema Information
#
# Table name: options
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string           default("bla bla bla bla blaaaaaaaaa")
#  service_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
