class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :contact_name
      t.string :contact_email
      t.string :phone
      t.string :customer_status
      t.text :memo

      t.timestamps
    end
    add_index :customers, :contact_email, unique: true
  end
end
