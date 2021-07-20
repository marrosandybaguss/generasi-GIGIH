require 'sinatra'
require_relative './db_connector'

get '/' do
    items = get_all_items_with_category
    erb :index, locals:{
        items: items
    }
end

get '/item/create' do
    categories = get_all_categories
    erb :create, locals:{
        categories: categories
    }
end

post '/item/create' do
    name = params['name']
    price = params['price']
    category = params['category']
    insert_item_with_category(name, price, category)
    redirect '/'
end




