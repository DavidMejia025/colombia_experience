class Quote < ApplicationRecord
    has_and_belongs_to_many :cities
    has_many :activities
    has_many :tours

    def add_activity(activity: activity)
      quote_activity                = activity.dup
      quote_activity_variable_costs = activity.clone_variable_costs

      self.activities << quote_activity

      self.activities.last.variable_costs << quote_activity_variable_costs
    end

    def calculate_total_cost
      self.activities.pluck(:total).sum
    end

    def calculate_total_cost_per_person
      self.activities.pluck(:total_per_person).sum
    end
end
