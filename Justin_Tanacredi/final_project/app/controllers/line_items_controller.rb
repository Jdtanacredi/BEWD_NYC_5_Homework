class LineItemsController < ApplicationController
  def index
  end

  def create
    @cart = current_cart
    product = Product.find params[product_id]
    @line_item = @cart.line_items.build
    @line_item.product = product
  end
end
