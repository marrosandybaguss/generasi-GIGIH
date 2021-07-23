require 'sinatra'
require './model/order'

get '/' do
    orders = get_all_orders
    erb :index, locals:{
        orders: orders
    }
end

get '/order/create' do
    erb :create
end

post '/order/create' do
    name = params['reference_no']
    price = params['customer_name']
    category = params['date']
    insert_item_with_category(name, price, category)
    redirect '/'
end
