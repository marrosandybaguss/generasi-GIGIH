require 'sinatra'
require './controllers/post_controller'
require './controllers/comment_controller'


post '/post' do
    controller = PostController.new
    controller.create_post(params)
end
