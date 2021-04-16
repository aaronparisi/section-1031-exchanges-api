class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.references :transaction, null: false, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
