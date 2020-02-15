class Activity < ApplicationRecord
    belongs_to :city
    has_one    :tour
    has_one    :quote
    has_many   :variable_costs

    def clone_variable_costs
      self.variable_costs.map do |variable_cost|
        variable_cost.dup
      end
    end

    def clone_activity
      self.dup
    end

    def calculate_cost
      variable_cost_checked = self.variable_costs.where(checked: true).distinct.first

      self.total = self.days * variable_cost_checked.cost
    end

    def calculate_cost_per_person
      variable_cost_checked = self.variable_costs.where(checked: true).distinct.first

      self.total_per_person = variable_cost_checked.cost * self.days / self.ocupation
    end
end
