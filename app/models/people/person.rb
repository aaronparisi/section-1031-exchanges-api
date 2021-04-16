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
  has_many :given_employments, as: :employerable
  has_many :employees, through: :given_employments

  has_many :received_employments, class_name: :Employment, foreign_key: :employee_id
  has_many :company_employers, through: :received_employments, source: :employerable, source_type: :Company
  has_many :person_employers, through: :received_employments, source: :employerable, source_type: :Person

  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :callable
  has_many :email_addresses, as: :emailable

  has_many :exchanges, as: :exchangorable
  has_many :owned_properties, as: :ownerable

  def employers
    return self.company_employers + self.person_employers
  end
  
end
