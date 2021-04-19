# == Schema Information
#
# Table name: exchanges
#
#  id                 :bigint           not null, primary key
#  deadline_180       :date
#  deadline_45        :date
#  exchange_status    :string           not null
#  exchange_type      :string           not null
#  exchangorable_type :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  coordinator_id     :bigint           not null
#  exchangorable_id   :bigint           not null
#
# Indexes
#
#  index_exchanges_on_coordinator_id  (coordinator_id)
#  index_exchanges_on_exchangorable   (exchangorable_type,exchangorable_id)
#
# Foreign Keys
#
#  fk_rails_...  (coordinator_id => people.id)
#
require "test_helper"

class ExchangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
