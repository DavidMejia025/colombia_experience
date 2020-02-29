class Price < ApplicationRecord
  has_and_belongs_to_many :quotes
  belongs_to :option
end
