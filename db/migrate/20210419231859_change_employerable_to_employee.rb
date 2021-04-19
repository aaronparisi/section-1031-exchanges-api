class ChangeEmployerableToEmployee < ActiveRecord::Migration[6.1]
  def change
    rename_column :employments, :employerable_id, :employer_id
    rename_column :employments, :employerable_type, :employer_type
  end
end
