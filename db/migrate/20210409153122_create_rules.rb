class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.text       :content, null: false
      t.references :house,   foreign_key: true
      t.timestamps
    end
  end
end
