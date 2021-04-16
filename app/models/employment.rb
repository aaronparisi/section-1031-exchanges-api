# == Schema Information
#
# Table name: employments
#
#  id                :bigint           not null, primary key
#  employerable_type :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  employee_id       :bigint           not null
#  employerable_id   :bigint           not null
#
# Indexes
#
#  index_employments_on_employee_id   (employee_id)
#  index_employments_on_employerable  (employerable_type,employerable_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => people.id)
#
class Employment < ApplicationRecord
  belongs_to :employerable, polymorphic: true
  belongs_to :employee, class_name: :Person, foreign_key: :employee_id
end
