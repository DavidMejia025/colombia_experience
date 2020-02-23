# == Schema Information
#
# Table name: activities
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :string
#  fixed_cost       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :integer
#  tour_id          :integer
#  quote_id         :integer
#  total            :integer
#  total_per_person :integer
#  days             :integer
#  ocupation        :integer
#

class Activity < ApplicationRecord
    belongs_to :city
    has_one    :tour
    has_one    :quote
    has_many   :activity_options
    has_many   :sub_activities

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

      self.update(total: self.days * variable_cost_checked.cost)
    end

    def calculate_cost_per_person
      variable_cost_checked = self.variable_costs.where(checked: true).distinct.first

      self.total_per_person = variable_cost_checked.cost * self.days / self.ocupation
    end
end
