class Activity < ApplicationRecord
    belongs_to :city
    has_one    :tour
    has_many   :variable_costs
end
