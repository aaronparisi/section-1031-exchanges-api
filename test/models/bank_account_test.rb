# == Schema Information
#
# Table name: bank_accounts
#
#  id             :bigint           not null, primary key
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bank_id        :bigint           not null
#  exchange_id    :bigint
#
# Indexes
#
#  index_bank_accounts_on_bank_id      (bank_id)
#  index_bank_accounts_on_exchange_id  (exchange_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_id => companies.id)
#  fk_rails_...  (exchange_id => exchanges.id)
#
require "test_helper"

class BankAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
