require 'sinatra'
require './controllers/order_controller'

get '/' do
    controller = OrderController.new
    controller.list_orders
end

get '/order/create' do
    controller = OrderController.new
    controller.create_order_form
end

post '/order/create' do
    controller = OrderController.new
    controller.create_order(params)
end
