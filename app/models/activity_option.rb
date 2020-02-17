# == Schema Information
#
# Table name: activity_options
#
#  id              :bigint           not null, primary key
#  capacity        :integer
#  cost            :integer
#  sub_activity_id :integer
#  activity_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  checked         :boolean          default(FALSE)
#

class ActivityOption < ApplicationRecord
  has_one  :activity
  has_one  :sub_activity
  # def self.clone_activity_options(activity: )
  #   activity.activity_options.map do |activity_option|
  #     activity_option.dup
  #   end
  # end
  #
  # def sums
  #   2+2
  # end
end
