class Api::PurchasesController < ApplicationController
  before_action :set_product, only: [:create, :drop]
  
  def index
  
  end
  
  def create
    product.purchases.create! create_params
  end
  
  def drop
    
  end
  
  private
  
  def create_params
    { quantity: params[:quantity], 
      price: @product.price, 
      total: @product.price * params[:quantity].to_i
    }
  end
  
  def set_product
    @product = Product.find params[:product_id]
  end
  
  def purchase_params
    params.permit(:product_id, :quantity)
  end
end