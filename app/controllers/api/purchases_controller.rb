class Api::PurchasesController < Api::BaseController
  
  def create
    purchase = Purchase.create(purchase_params.merge({user_id: current_user.id}))
    current_user = User.find(1)
    current_user.purchases << purchase
  end
  
  private
  def purchase_params
    params.require(:purchase).permit(:product_id, :quantity)
  end
end