class CreateAllocations < ActiveRecord::Migration[6.1]
  def change
    create_table :allocations do |t|
      t.integer :hospital_id
      t.integer :specialty_id
      t.integer :available_slots
      t.integer :used_slots
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
