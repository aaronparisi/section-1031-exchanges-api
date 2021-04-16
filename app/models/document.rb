# == Schema Information
#
# Table name: documents
#
#  id             :bigint           not null, primary key
#  body           :text
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  transaction_id :bigint           not null
#
# Indexes
#
#  index_documents_on_transaction_id  (transaction_id)
#
# Foreign Keys
#
#  fk_rails_...  (transaction_id => transactions.id)
#
class Document < ApplicationRecord
  # belongs_to :exchange_transaction
  belongs_to :exchange_transaction, class_name: :Transaction, foreign_key: :transaction_id
end
