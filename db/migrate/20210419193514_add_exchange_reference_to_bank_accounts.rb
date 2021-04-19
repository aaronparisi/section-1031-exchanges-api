class AddExchangeReferenceToBankAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :bank_accounts, :exchange, foreign_key: true
  end
end
