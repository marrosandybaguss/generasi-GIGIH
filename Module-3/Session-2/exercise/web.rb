require 'sinatra'
require_relative './model/category.rb'
require_relative './model/item.rb'

get '/' do
    items = Item.get_all_items_with_category
    erb :index, locals:{
        items: items
    }
end

get '/item/create' do
    categories = Category.get_all_categories
    erb :create, locals:{
        categories: categories
    }
end

post '/item/create' do
    name = params['name']
    price = params['price']
    category = params['category']
    item = Item.new(nil, name, price)
    item.insert_item_with_category(category)
    redirect '/'
end

get '/item/edit' do
    item_id = params['id'].to_i
    item = Item.get_item_with_category(item_id)
    categories = Category.get_all_categories
    erb :edit, locals:{
        item: item,
        categories: categories
    }
end

post '/item/edit' do
    id = params['id']
    name = params['name']
    price = params['price']
    category = params['category']
    item = Item.new(id, name, price)
    item.update_item_with_category(category)
    redirect '/'
end

get '/item/show' do
    item_id = params['id'].to_i
    item = Item.get_item_with_category(item_id)
    erb :show, locals:{
        item: item
    }
end

get '/item/delete' do
    item_id = params['id'].to_i
    item = Item.new(item_id, nil, nil)
    item.delete_item_with_category
    redirect '/'
end
