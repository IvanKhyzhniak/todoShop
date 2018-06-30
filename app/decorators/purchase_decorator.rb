class PurchaseDecorator < Draper::Decorator
  delegate_all

  def total 
    '%.2f$' % (total/100.0) 
  end
  
end
