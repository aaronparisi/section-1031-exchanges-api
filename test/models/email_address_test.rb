# == Schema Information
#
# Table name: email_addresses
#
#  id             :bigint           not null, primary key
#  email          :string
#  emailable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  emailable_id   :bigint           not null
#
# Indexes
#
#  index_email_addresses_on_emailable  (emailable_type,emailable_id)
#
require "test_helper"

class EmailAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
