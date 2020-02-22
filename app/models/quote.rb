# == Schema Information
#
# Table name: quotes
#
#  id               :bigint           not null, primary key
#  name             :string
#  total            :integer
#  total_per_person :integer
#  margin           :integer
#  trm              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Quote < ApplicationRecord
    has_and_belongs_to_many :cities
    has_many :activities
    has_many :tours

    def add_activity(activity:)
      quote_activity = activity.dup
      self.activities << quote_activity

      if activity.sub_activities
        sub_activities = SubActivity.clone(activity: activity)

        self.activities.last.sub_activities << sub_activities

        activity.sub_activities.each do|sub_activity|
          activity_options = ActivityOption.clone(activity: sub_activity)

          puts destination_sub_activity = sub_activities.select{|sub_act| sub_act.name == sub_activity.name}.first

          destination_sub_activity.activity_options << activity_options
        end
      else
      end
    end

    def calculate_total_cost
      total_cost = self.activities.pluck(:total).sum

      self.update(total: total_cost)
    end

    def calculate_total_cost_per_person
      total_cost_per_person = self.activities.pluck(:total_per_person).sum

      self.update(total_per_person: total_cost_per_person)
    end
end
