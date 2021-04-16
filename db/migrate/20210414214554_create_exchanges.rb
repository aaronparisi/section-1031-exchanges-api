class CreateExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanges do |t|
      t.references :coordinator, null: false, index: true, foreign_key: { to_table: :people }
      t.references :exchangorable, polymorphic: true, null: false
      t.date :deadline_45
      t.date :deadline_180

      t.timestamps
    end
  end
end
