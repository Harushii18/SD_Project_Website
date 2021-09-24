class AddFieldToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :specialty_duration, :string
  end
end
