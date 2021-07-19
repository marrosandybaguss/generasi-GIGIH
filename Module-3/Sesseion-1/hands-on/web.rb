require 'sinatra'
require_relative './db_connector'

get '/' do
    items = get_all_items
    erb :index, locals:{
        items: items
    }
end

get '/items/create' do
    erb :create
end

post '/items/create' do
    name = params['name']
    price = params['price']
    insert_item(name, price)
    redirect '/'
end

get '/with-category' do
    items = get_all_items_with_category
    erb :item_with_category, locals:{
        items: items
    }
end

get '/items/with-category/create' do
    categories = get_all_categories
    erb :create_with_category, locals:{
        categories: categories
    }
end

post '/items/with-category/create' do
    name = params['name']
    price = params['price']
    category = params['category']
    insert_item_with_category(name, price, category)
    redirect '/with-category'
end



