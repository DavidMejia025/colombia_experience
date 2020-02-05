class Activity < ApplicationRecord
    belongs_to :city
    has_one    :tour
    has_one    :quote
    has_many   :variable_costs
end
