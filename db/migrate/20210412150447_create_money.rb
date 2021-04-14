class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.string     :item_name, null: false
      t.integer    :price,     null: false
      t.string     :user_name, null: false
      t.references :house,     foreign_key: true
      t.timestamps
    end
  end
end
