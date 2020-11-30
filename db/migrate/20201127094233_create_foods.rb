class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string  :food_name, null: false
      t.integer :kcal,      null: false
      t.integer :g
      
      t.timestamps
    end
  end
end
