# == Schema Information
#
# Table name: sub_activities
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  activity_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SubActivity < ApplicationRecord
  has_many :activity_options

  belongs_to :activity

  def self.clone_sub_activity(activity:)
    activity.sub_activities.map do |sub_activities|
      sub_activities.dup
    end
  end
end
