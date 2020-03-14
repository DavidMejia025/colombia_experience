# == Schema Information
#
# Table name: clients
#
#  id           :bigint           not null, primary key
#  name         :string           default("Operador NYC")
#  email        :string           default("marathon@nyc.com")
#  phone_number :string           default("1004123123")
#  type         :string           default("external")
#  discount     :integer          default("0")
#  image_url    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Client < ApplicationRecord
end
