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

  describe '#create' do
    context 'with valid parameter' do
      it 'create a new post' do
        post_controller = PostController.new
        post_params = { id: nil, post: 'this is #post' }

        stub_model = double
        mock_post_return = double
        controller_result = post_controller.create_post(post_params)

        allow(Post).to receive(:new).with(post_params).and_return(stub_model)
        allow(stub_model).to receive(:insert_post).and_return(mock_post_return)
        allow(mock_post_return).to receive(:each)

        expect(controller_result).to eq({
                                          'status' => 200,
                                          'message' => 'Success'
                                        })
      end
    end
  end
end
