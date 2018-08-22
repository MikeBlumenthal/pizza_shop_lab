require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order')
also_reload('./models/pizza_order')
#home page?
get '/' do
  erb( :home )
end

#index
get '/pizza-orders' do
  @orders = PizzaOrder.all
  erb( :index )
end

#new
get '/pizza-orders/new' do
  erb( :new )
end

#show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find( params[:id] )
  erb( :show )
end

#create
post '/pizza-orders' do
  PizzaOrder.new(params).save
  redirect to '/pizza-orders'
end

#edit
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find( params[:id] )
  erb( :edit )
end

#update
post '/pizza-orders/:id' do
  PizzaOrder.new(params).update
  redirect to '/pizza-orders'
end

#delete
get '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find( params[:id] )
  erb( :destroy )
end

post '/pizza-orders/:id/delete' do
  PizzaOrder.find( params[:id] ).delete
  redirect to "/pizza-orders"
end
