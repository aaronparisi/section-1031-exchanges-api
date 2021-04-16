# == Schema Information
#
# Table name: bank_accounts
#
#  id             :bigint           not null, primary key
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bank_id        :bigint           not null
#
# Indexes
#
#  index_bank_accounts_on_bank_id  (bank_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_id => companies.id)
#
class BankAccount < ApplicationRecord
  belongs_to :bank
end
