class CreateEmailAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :email_addresses do |t|
      t.string :email
      t.references :emailable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
