class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string     :work_name, null: false
      t.string     :user_name, null: false
      t.references :house,     foreign_key: true
      t.timestamps
    end
  end
end
