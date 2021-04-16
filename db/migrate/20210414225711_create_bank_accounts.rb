class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number
      t.references :bank, null: false, index: true, foreign_key: { to_table: :companies }

      t.timestamps
    end
  end
end
