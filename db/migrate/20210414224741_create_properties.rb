class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.references :transaction, null: false, foreign_key: true
      t.references :ownerable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
