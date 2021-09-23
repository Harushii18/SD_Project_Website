class AddFieldnameToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :week_no, :integer
  end
end
