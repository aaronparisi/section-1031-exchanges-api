# == Schema Information
#
# Table name: faxes
#
#  id           :bigint           not null, primary key
#  faxable_type :string           not null
#  number       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  faxable_id   :bigint           not null
#
# Indexes
#
#  index_faxes_on_faxable  (faxable_type,faxable_id)
#
require "test_helper"

class FaxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
