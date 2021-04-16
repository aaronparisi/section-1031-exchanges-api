class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.references :employer, index: true, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
