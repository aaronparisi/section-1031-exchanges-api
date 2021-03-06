# == Schema Information
#
# Table name: employments
#
#  id            :bigint           not null, primary key
#  employer_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :bigint           not null
#  employer_id   :bigint           not null
#
# Indexes
#
#  index_employments_on_employee_id   (employee_id)
#  index_employments_on_employerable  (employer_type,employer_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => people.id)
#
require "test_helper"

class EmploymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
