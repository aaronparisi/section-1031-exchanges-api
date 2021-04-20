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
  has_many :employments, as: :employer
  has_many :employees, through: :employments

  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :callable
  has_many :email_addresses, as: :emailable

  has_many :exchanges, as: :exchangorable#, -> { where type: "Facilitator" }
  has_many :owned_properties, as: :ownerable

  has_many :managed_exchanges, through: :employees, source: :exchanges_as_coordinator#, -> { where type: "Facilitator" }

  has_many :managed_bank_accounts, class_name: :BankAccount, foreign_key: :bank_id#, -> { where type: "Bank" }
end
