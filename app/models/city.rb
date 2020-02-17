# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  subtotal   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ApplicationRecord
    has_many :activities
    has_many :tours

    has_and_belongs_to_many :quotes
end
