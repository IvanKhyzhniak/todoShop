User h_m orders             #
     h_m purchases          #
email                       #
password_diges              #
#############################
Product m2m order           #
        h_m purchases       #
name                        #
price                       #
photo                       #
#############################
Order h_m purchase          # 
      b_t user              #
total                       #        
#############################
Purchase b_t order(optional)# pocupca
         b_t user           #
         b_t product        #
quantity                    #
price                       #
total                       #
#############################
#All prices should be in cents!!!!
https://github.com/drapergem/draper

purchase.total => 1444
purchase.decorate.total=>"14.44$"


1.POST /api/purchases/
	Request:
	{
		product_id: 1,	quantity: 2
	}

Response
same as GET

2.GET /api/purchases     (per 5)
	Response
	{
		“collection” : 
			[
				{
					id: 1,   (purchase_id)
					product_id: 1,
					user_id: 3,
					quantity : 2
				}
			],
		“total_pages” : 1,
		“current_page” : 1
	}

3. POST /api/purchases/drop
	Request
	{
		product_id : 1,
		quantity : 1
  }
response
same as GET



MAXIMUM

4.Checkout
	POST /orders
Reqest		
{}
Response:
	{
		id: 1(order_id),
		user_id : 2,
		purchases : 
			[
				{
					id : 1,(purchase_id)
					product_id : 1,
					quantity : 1,
					order_id : 1
				}
			],
		sum : 200,
		status : “pending”
	}

5. GET /api/orders
	Request
		{}
	Response
		Same as post but collection with pagination

def collection
	@collection ||= Order.all.page(params[:page]).per(5)
end

index.json.erb
<%= sanitize ({ collection: collection.decorate.as_json, total_pages: collection.total_pages, current_page: collection.current_page }).to_json %>

 https://www.getpostman.com

 
POSTMAN
https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one