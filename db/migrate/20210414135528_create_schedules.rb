class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_time, null: false
      t.string :event, null: false
      t.string :user_name, null: false
      t.references :house, foreign_key: true
      t.timestamps
    end
  end
end
