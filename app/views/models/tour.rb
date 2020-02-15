class Tour < ApplicationRecord
    has_many :activities
    has_one    :quote
    belongs_to :city
end
