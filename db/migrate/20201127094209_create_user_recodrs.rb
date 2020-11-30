class CreateUserRecodrs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recodrs do |t|
      t.date       :date
      t.string     :food_name, null: false
      t.integer    :kcal,      null: false
      t.integer    :g
      t.references :user,      foreign_key: true
      
      t.timestamps
    end
  end
end
