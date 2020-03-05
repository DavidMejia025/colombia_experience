# == Schema Information
#
# Table name: service_costs
#
#  id         :bigint           not null, primary key
#  services   :integer          default("1")
#  pax        :integer          default("7")
#  quote_id   :integer
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ServiceCost < ApplicationRecord
  belongs_to :quote
  belongs_to :service
end
