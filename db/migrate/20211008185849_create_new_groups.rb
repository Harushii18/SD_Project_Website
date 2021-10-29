class CreateNewGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :programme, null: false, foreign_key: true
      t.string :group_name
 
      t.timestamps
    end
  end
end
