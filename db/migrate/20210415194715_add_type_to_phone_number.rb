class AddTypeToPhoneNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :phone_numbers, :type, :string
  end
end
