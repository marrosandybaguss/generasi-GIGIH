require 'sinatra'
require './controllers/item_controller'

get '/' do
    controller = ItemController.new
    controller.list_items
end

get '/item/create' do
    controller = ItemController.new
    controller.create_item_form
end

post '/item/create' do
    controller = ItemController.new
    controller.create_item(params)
end

get '/item/show' do
    item_id = params['id']
    controller = ItemController.new
    controller.create_item(item_id)
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

get '/item/delete' do
    item_id = params['id'].to_i
    item = Item.new(item_id, nil, nil)
    item.delete_item_with_category
    redirect '/'
end
