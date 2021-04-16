class CreateFaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :faxes do |t|
      t.string :number
      t.references :faxable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
