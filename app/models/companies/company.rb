# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  ein        :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  has_many :given_employments, as: :employerable
  has_many :employees, through: :given_employments

  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :callable
  has_many :email_addresses, as: :emailable

  has_many :exchanges, as: :exchangorable
  has_many :owned_properties, as: :ownerable
end
