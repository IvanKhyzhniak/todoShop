class SessionDecorator < ApplicationDecorator
  delegate_all

  def as_json
    {  user: 
             {   
                email: current_user.email, 
                full_name: current_user.full_name,
                finished_orders_count: current_user.orders.where(status: :accepted).count
             },
      session: 
                {
                  auth_token: current_session.auth_token
                }
    }
  end
  
end
