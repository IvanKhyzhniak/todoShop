curl -H 'Accept: application/json' -d '{"email": "lol@lol.kek", "password": "123"}'  https://mlsdev-chat-ivanhizh.c9users.io/api/sessions
curl -H 'Accept: application/json' -H 'Authorization: Token token="CwUtBUnxPZiPM9vTjGhzrA1i"' -X "DELETE"  https://mlsdev-chat-ivanhizh.c9users.io/api/sessions



1)remove table orders_products √
2)add Authorization as in chats 
add Session model         √
copy paste application controller from chats √
add first_name and last_name attribute to User √
add auth_token attribute to Session with generation on create √
session b_t User, User has_many sessions   √
add before action(except Session create)   √
POST /api/sessions √?
request:
		{email: string,
password: string}
	response: 
		user: 
{
email: string,
full_name: string,
finished_orders_count: int 
},
session:
{ 
auth_token: string
}
	### optional DELETE /api/sessions
		request no_body
		response 204 No Content
rename Purchase to LineItem √
rework Purchase Controller to have only :build_resource, :resource, :collection methods as is in chats
POST /api/line_items
	request:
	{
		action: "add" ("remove"),
		product_id: int,
		quantity: int
}
10. add service folder, add LineItemHandler.new(current_user, params).save
метод сейв
смотришь или существует у юзера лайн айтем такой же
если есть то добавляешь(отнимаешь), если нет то создаешь с заданый кол-вом
при минусовом кол-ве товаров в лайн айтеме - он удаляется
















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

curl -H "Content-Type: application/json" -d '{ "product_id": 1, "quantity": 2 }' https://mlsdev-chat-ivanhizh.c9users.io/api/purchases

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