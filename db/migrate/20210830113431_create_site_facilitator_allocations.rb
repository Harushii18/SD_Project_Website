class CreateSiteFacilitatorAllocations < ActiveRecord::Migration[6.1]
  def change
    create_table :site_facilitator_allocations do |t|
      t.integer :hospital_id
      t.integer :site_facilitator_id

      t.timestamps
    end
  end
end
