class City < ApplicationRecord
  has_and_belongs_to_many :quotes
  has_and_belongs_to_many :vendors

  has_many :services
  has_many :tours
end
