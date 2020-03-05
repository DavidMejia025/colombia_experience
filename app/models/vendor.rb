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
class Vendor < ApplicationRecord
  has_and_belongs_to_many :cities
  belongs_to :category
  has_many :services
end
