class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :code,null:false
      t.string :name,null:false
      t.string :category,null:false
      t.integer :price,null:false
      t.integer :stock,null:false
      t.integer :alert_threshold,null:false
      t.boolean :is_active,null:false
      t.text :description
      t.timestamps
    end

    add_index :products, :code, unique: true
  end
end
