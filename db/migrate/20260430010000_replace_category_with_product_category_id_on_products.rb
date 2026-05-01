class ReplaceCategoryWithProductCategoryIdOnProducts < ActiveRecord::Migration[8.1]
  class MigrationProduct < ActiveRecord::Base
    self.table_name = "products"
  end

  class MigrationProductCategory < ActiveRecord::Base
    self.table_name = "product_categories"
  end

  def up
    add_reference :products, :product_category, null: true, foreign_key: true

    MigrationProduct.reset_column_information
    MigrationProductCategory.reset_column_information

    ["食品", "日用品", "電化製品", "衣類", "その他"].each do |name|
      MigrationProductCategory.find_or_create_by!(name: name)
    end

    MigrationProduct.find_each do |product|
      category = MigrationProductCategory.find_or_create_by!(name: product.category)
      product.update_columns(product_category_id: category.id)
    end

    other_category = MigrationProductCategory.find_or_create_by!(name: "その他")
    MigrationProduct.where(product_category_id: nil).update_all(product_category_id: other_category.id)

    change_column_null :products, :product_category_id, false
    remove_column :products, :category, :string
  end

  def down
    add_column :products, :category, :string

    MigrationProduct.reset_column_information
    MigrationProductCategory.reset_column_information

    MigrationProduct.find_each do |product|
      category = MigrationProductCategory.find_by(id: product.product_category_id)
      product.update_columns(category: category&.name || "その他")
    end

    change_column_null :products, :category, false
    remove_reference :products, :product_category, foreign_key: true
  end
end
