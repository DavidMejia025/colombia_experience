class City < ApplicationRecord
    has_many :activities
    has_many :tours

    has_and_belongs_to_many :quotes
end
