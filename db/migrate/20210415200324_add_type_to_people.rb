class AddTypeToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :type, :string
  end
end
