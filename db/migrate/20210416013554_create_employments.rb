class CreateEmployments < ActiveRecord::Migration[6.1]
  def change
    create_table :employments do |t|
      t.references :employerable, polymorphic: true, null: false
      t.references :employee, null: false, index: true, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
