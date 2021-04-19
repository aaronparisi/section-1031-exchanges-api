class AddInConstraintsToExchangeTypeAndStatus < ActiveRecord::Migration[6.1]
  def change
    rename_column :exchanges, :status, :exchange_status

    change_column :exchanges, :exchange_status, :string, null: false
    change_column :exchanges, :exchange_type, :string, null: false
    
    add_check_constraint :exchanges, "exchange_status IN ('contacted', 'open', 'cancelled', 'hold', 'closed')", name: "exchange_status_check"
    add_check_constraint :exchanges, "exchange_type IN ('forward', 'reverse', 'improvementForward', 'improvementReverse')", name: "exchange_type_check"
  end
end
