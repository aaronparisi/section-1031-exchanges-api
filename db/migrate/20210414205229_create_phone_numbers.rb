class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.references :callable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
