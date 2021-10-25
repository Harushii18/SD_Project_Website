class RemoveGroups < ActiveRecord::Migration[6.1]
    def change
      remove_foreign_key :groups, :blocks
      remove_foreign_key :groups, :specialties
      drop_table :groups 

    end
  end
  