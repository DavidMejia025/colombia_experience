# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  client     :string           default("Operador NYC")
#  trm        :integer          default("3235")
#  margin     :integer          default("24")
#  currency   :string           default("COP")
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
