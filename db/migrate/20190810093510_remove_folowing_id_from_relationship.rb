class RemoveFolowingIdFromRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :folowing_id, :integer
  end
end
