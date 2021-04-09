class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string     :user_name, null: false
      t.string     :birthday,  null: false
      t.references :house,     foreign_key: true
      t.timestamps
    end
  end
end
