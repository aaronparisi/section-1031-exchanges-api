class ChangeEmployerReferenceToPolymorphic < ActiveRecord::Migration[6.1]
  def change
    remove_reference :people, :employer, index: true, foreign_key: { to_table: :people }
    add_reference :people, :employerable, polymorphic: true
  end
end
