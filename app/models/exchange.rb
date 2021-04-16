# == Schema Information
#
# Table name: exchanges
#
#  id                 :bigint           not null, primary key
#  deadline_180       :date
#  deadline_45        :date
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
class Exchange < ApplicationRecord
  belongs_to :coordinator
  belongs_to :exchangorable, polymorphic: true

  has_many :transactions, class_name: :Transactions, foreign_key: :exchange_id
end
