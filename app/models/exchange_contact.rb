# == Schema Information
#
# Table name: exchange_contacts
#
#  id           :bigint           not null, primary key
#  main_contact :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  contact_id   :bigint           not null
#  exchange_id  :bigint           not null
#
# Indexes
#
#  index_exchange_contacts_on_contact_id                    (contact_id)
#  index_exchange_contacts_on_exchange_id                   (exchange_id)
#  index_exchange_contacts_on_main_contact_and_exchange_id  (main_contact,exchange_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (contact_id => people.id)
#  fk_rails_...  (exchange_id => exchanges.id)
#
class ExchangeContact < ApplicationRecord
  belongs_to :exchange
end
