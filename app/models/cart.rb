class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  # Other associations and methods  

  def add_product(product)
    # Find or create a line item for the product    
    current_item = line_items.find_by(product_id: product.id)
    
    # If no existing line item, create a new one
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
      current_item.price = product.price # Set price from product
    end
    current_item
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
