class Quote < ApplicationRecord
    has_and_belongs_to_many :cities
    has_many :activities
    has_many :tours
end
