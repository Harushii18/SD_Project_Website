class CreateGroups < ActiveRecord::Migration[6.1]
    def change
      create_table :groups do |t|
        t.belongs_to :specialty, null: false, foreign_key: true
        t.belongs_to :block, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end