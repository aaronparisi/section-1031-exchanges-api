# == Schema Information
#
# Table name: properties
#
#  id             :bigint           not null, primary key
#  ownerable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ownerable_id   :bigint           not null
#  transaction_id :bigint           not null
#
# Indexes
#
#  index_properties_on_ownerable       (ownerable_type,ownerable_id)
#  index_properties_on_transaction_id  (transaction_id)
#
# Foreign Keys
#
#  fk_rails_...  (transaction_id => transactions.id)
#
class Property < ApplicationRecord
  belongs_to :exchange_transaction, class_name: :Transaction, foreign_key: :transaction_id
  belongs_to :ownerable, polymorphic: true

  has_one :address, as: :addressable
end
