require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# HOME
get '/' do
  erb(:home)
end

# INDEX

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

# NEW

get '/pizza-orders/new' do
  erb(:new)
end

# SHOW

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params['id'])
  erb(:show)
end

# CREATE

post '/pizza-orders' do
  @new_order = PizzaOrder.new(params)
  @new_order.save()
  redirect to '/pizza-orders'
end

# EDIT

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params['id'])
  erb(:edit)
end

# UPDATE

post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params).update()
  redirect to "/pizza-orders"
end

# DELETE

get '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params['id'])
  @order.delete()
  redirect to '/pizza-orders'
end
