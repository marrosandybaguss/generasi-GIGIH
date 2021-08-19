# frozen_string_literal: true

require 'json'
require_relative "../test_helper"
require_relative '../../controllers/trending_controller'
require_relative '../../models/post'
require_relative '../../models/comment'

describe TrendingController do
  context 'get hastagh in sentence of post' do
    it 'should return list of hastagh' do
      controller = TrendingController.new

      hastagh_array = []
      data = 'this is #post thats #comment'
      response = controller.containing_hastaghs(hastagh_array, data)

      expect(response).to eq(['#post', '#comment'])
    end
  end

  context 'get 5 top of hastagh from list of hastagh' do
    it 'should return 5 top of hastagh' do
      controller = TrendingController.new

      top = 5
      hastaghs = ['#post', '#comment', '#comment', '#post', '#post']
      response = controller.produce_top_hastagh(hastaghs, top)

      result = [{ hastagh: '#post', trending: 1 },
                { hastagh: '#comment', trending: 2 },
                { hastagh: nil, trending: 3 },
                { hastagh: nil, trending: 4 },
                { hastagh: nil, trending: 5 }]
      expect(response).to eq(result)
    end
  end

  context 'get 5 top of hastagh from data from database' do
    it 'should return 5 top of hastagh' do
      controller = TrendingController.new

      response = controller.trending_hastagh

      posts = Post.select_post_24hours
      comments = Comment.select_comment_24hours
      hastaghs = []
      top = 5
      posts.each do |row|
        post = row[:post]
        hastaghs = controller.containing_hastaghs(hastaghs, post)
      end
      comments.each do |row|
        comment = row[:comment]
        hastaghs = controller.containing_hastaghs(hastaghs, comment)
      end
      result = controller.produce_top_hastagh(hastaghs, top)

      expect(response).to eq(result.to_json)
    end
  end
end
