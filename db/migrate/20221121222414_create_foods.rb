class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false, defaul: 'unit'
      t.float :price, null: false, defaul: 1
      t.float :quantity, default: 0

      t.timestamps
    end
  end
end
