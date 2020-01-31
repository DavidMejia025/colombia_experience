class Tour < ApplicationRecord
    has_many :activities

    belongs_to :city
end
