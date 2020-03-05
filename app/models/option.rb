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
class Option < ApplicationRecord
  has_and_belongs_to_many :quotes
  belongs_to :service
  has_many :prices
end
