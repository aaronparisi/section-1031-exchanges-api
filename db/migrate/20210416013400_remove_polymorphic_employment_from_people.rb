class RemovePolymorphicEmploymentFromPeople < ActiveRecord::Migration[6.1]
  def change
    remove_reference :people, :employerable, polymorphic: true
  end
end
