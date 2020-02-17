# == Schema Information
#
# Table name: tours
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :string
#  total            :integer
#  total_per_person :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :integer
#  quote_id         :integer
#

class Tour < ApplicationRecord
    has_many :activities
    has_one    :quote
    belongs_to :city
end
