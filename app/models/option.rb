class Option < ApplicationRecord
  has_and_belongs_to_many :quotes
  belongs_to :service
  has_many :prices
end
