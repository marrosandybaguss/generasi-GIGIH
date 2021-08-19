# frozen_string_literal: true

require 'json'
require_relative '../../controllers/post_controller'
require_relative '../../models/post'

describe PostController do
  describe '#show' do
    it 'should show list post with apropiate hastagh in json' do
      controller = PostController.new

      hastagh = '#post'
      response = controller.list_filter_posts(hastagh)

      posts = Post.select_filter_posts(hastagh)
      expect(response).to eq(posts.to_json)
    end
  end
end
