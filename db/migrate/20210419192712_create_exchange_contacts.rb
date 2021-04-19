class CreateExchangeContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_contacts do |t|
      t.references :contact, null: false, index: true, foreign_key: { to_table: :people }
      t.references :exchange, null: false, foreign_key: true
      t.boolean :main_contact

      t.timestamps
    end

    add_index :exchange_contacts, [:main_contact, :exchange_id], unique: true
  end
end
