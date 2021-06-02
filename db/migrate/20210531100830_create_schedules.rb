class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_time
      t.date :finish_time
      t.string :all_day
      t.string :schedule_memo

      t.timestamps
    end
  end
end
