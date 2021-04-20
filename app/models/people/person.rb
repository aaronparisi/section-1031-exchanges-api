# == Schema Information
#
# Table name: people
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Person < ApplicationRecord
  has_many :employments, as: :employer
  has_many :employees, through: :employments

  has_many :received_employments, class_name: :Employment, foreign_key: :employee_id
  has_many :company_employers, through: :received_employments, source: :employer, source_type: :Company
  has_many :person_employers, through: :received_employments, source: :employer, source_type: :Person

  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :callable
  has_many :email_addresses, as: :emailable

  has_many :exchanges_as_exchangor, as: :exchangorable
  has_many :owned_properties, as: :ownerable

  has_many :exchanges_as_contact, class_name: :ExchangeContact, foreign_key: :contact_id
  has_many :exchanges_as_coordinator, class_name: :Exchange, foreign_key: :coordinator_id

  def employers
    return self.company_employers + self.person_employers
  end
  
end
