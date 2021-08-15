require 'sinatra'
require './controllers/post_controller'
require './controllers/comment_controller'


post '/post' do
    controller = PostController.new
    controller.create_post(params)
end

get '/posts/:hastagh' do
    hastagh = params['hastagh']
    hastagh = '#' + hastagh
    controller = PostController.new
    controller.list_filter_posts(hastagh)
end
