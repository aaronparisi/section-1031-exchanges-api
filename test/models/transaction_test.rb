# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exchange_id :bigint           not null
#
# Indexes
#
#  index_transactions_on_exchange_id  (exchange_id)
#
# Foreign Keys
#
#  fk_rails_...  (exchange_id => exchanges.id)
#
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
