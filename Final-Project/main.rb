# frozen_string_literal: true

require 'sinatra'
require './controllers/post_controller'
require './controllers/comment_controller'
require './controllers/trending_controller'

post '/post' do
  controller = PostController.new
  controller.create_post(params)
end

get '/posts/:hastagh' do
  hastagh = params['hastagh']
  hastagh = "##{hastagh}"
  controller = PostController.new
  controller.list_filter_posts(hastagh)
end

get '/trending' do
  controller = TrendingController.new
  controller.trending_hastagh
end

post '/comment' do
  controller = CommentController.new
  controller.create_comment(params)
end
