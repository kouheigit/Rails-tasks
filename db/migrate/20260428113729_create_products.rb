class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :category
      t.integer :price
      t.integer :stock
      t.integer :alert_threshold
      t.boolean :is_active
      t.text :description

      t.timestamps
    end
  end
end
