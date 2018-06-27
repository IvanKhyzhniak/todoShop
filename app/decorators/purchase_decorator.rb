class PurchaseDecorator < Draper::Decorator
  delegate_all

  def total cents
    '%.2f$' % (cents/100.0) # cents = quantity * price
  end
  
end
