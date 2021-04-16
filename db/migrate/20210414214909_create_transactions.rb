class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :exchange, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
