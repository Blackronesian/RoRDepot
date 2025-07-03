class AddOrderToLineItem < ActiveRecord::Migration[7.2]
  def change
    # Check if the column 'order_id' already exists
    unless column_exists?(:line_items, :order_id)
      add_reference :line_items, :order, null: true, foreign_key: true
    end

    # You may also need to ensure 'cart_id' column is changed properly (if not done already)
    change_column :line_items, :cart_id, :bigint, null: true
  end
end

