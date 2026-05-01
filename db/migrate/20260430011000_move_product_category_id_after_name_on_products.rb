class MoveProductCategoryIdAfterNameOnProducts < ActiveRecord::Migration[8.1]
  def up
    execute "ALTER TABLE products MODIFY product_category_id BIGINT NOT NULL AFTER name"
  end

  def down
    execute "ALTER TABLE products MODIFY product_category_id BIGINT NOT NULL AFTER price"
  end
end
