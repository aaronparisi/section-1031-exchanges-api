class AddFieldsToExchange < ActiveRecord::Migration[6.1]
  def change
    execute <<-SQL
      CREATE TYPE exchange_status AS ENUM ('contacted', 'open', 'cancelled', 'hold', 'closed')
    SQL
    execute <<-SQL
      CREATE TYPE type_of_exchange AS ENUM ('forward', 'reverse', 'improvement-forward', 'improvement-reverse')
    SQL
    
    add_column :exchanges, :status, :exchange_status, null: false
    add_column :exchanges, :exchange_type, :type_of_exchange, null: false
  end
end
