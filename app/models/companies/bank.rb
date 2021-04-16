# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  ein        :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < Company
  has_many :bank_accounts, class_name: :BankAccount, foreign_key: :bank_id
end
