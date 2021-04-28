class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :list, null: false
      t.string :limit, null: false
      t.string :user_name, null: false
      t.references :house, foreign_key: true
      t.timestamps
    end
  end
end
