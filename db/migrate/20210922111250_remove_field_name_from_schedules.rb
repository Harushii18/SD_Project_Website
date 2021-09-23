class RemoveFieldNameFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :rotation_id, :integer
  end
end
