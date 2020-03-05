# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord
  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :vendors

  has_many :services
  has_many :tours
end
