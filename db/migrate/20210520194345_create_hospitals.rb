class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name
      t.string :hospital_locatioin
      t.string :hospital_contactNo

      t.timestamps
    end
  end
end
