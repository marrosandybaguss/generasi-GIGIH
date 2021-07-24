require 'sinatra'
require './controllers/item_controller'
require './controllers/category_controller'

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
    controller.show_item(item_id)
end

get '/item/edit' do
    item_id = params['id']
    controller = ItemController.new
    controller.edit_item_form(item_id)
end

post '/item/edit' do
    controller = ItemController.new
    controller.edit_item(params)
end

get '/item/delete' do
    controller = ItemController.new
    controller.delete_item(params)
end


get '/category' do
    controller = CategoryController.new
    controller.list_categories
end

get '/category/create' do
    controller = CategoryController.new
    controller.create_category_form
end

post '/category/create' do
    controller = CategoryController.new
    controller.create_category(params)
end

get '/category/edit' do
    id = params['id']
    controller = CategoryController.new
    controller.edit_category_form(id)
end

post '/category/edit' do
    controller = CategoryController.new
    controller.edit_category(params)
end

get '/category/delete' do
    controller = CategoryController.new
    controller.delete_category(params)
end

get '/category/with-item' do
    controller = CategoryController.new
    controller.list_categories_with_item
end
