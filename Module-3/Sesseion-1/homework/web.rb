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

get '/item/edit' do
    erb :edit
end


get '/item/show' do
    item_id = params['id'].to_i
    item = get_item_with_category(item_id)
    erb :show, locals:{
        item: item
    }
end

get '/item/delete' do
    redirect '/'
end
