class RemoveEnumFromExchanges < ActiveRecord::Migration[6.1]
  def change
    execute <<-SQL
      DROP TYPE type_of_exchange
    SQL
    execute <<-SQL
      DROP TYPE exchange_status
    SQL
  end
end
