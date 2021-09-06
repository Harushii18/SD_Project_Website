class DropBlocksTable < ActiveRecord::Migration[6.1]
  def up
    remove_index :hospital_assignments, name: "index_hospital_assignments_on_block_id"
    remove_index :groups, name: "index_groups_on_block_id"
    remove_foreign_key :groups, :blocks
    remove_foreign_key :hospital_assignments, :blocks
    drop_table :blocks
  end


end
