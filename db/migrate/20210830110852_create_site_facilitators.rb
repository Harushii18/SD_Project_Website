class CreateSiteFacilitators < ActiveRecord::Migration[6.1]
  def change
    create_table :site_facilitators do |t|
      t.string :Site_Facilitator_Name
      t.string :Site_Facilitator_ContactNo
      t.string :Site_Facilitator_Email

      t.timestamps
    end
  end
end
