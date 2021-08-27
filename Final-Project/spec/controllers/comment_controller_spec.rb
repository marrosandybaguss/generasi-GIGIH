# frozen_string_literal: true

require 'json'
require_relative "../test_helper"
require_relative '../../controllers/comment_controller'
require_relative '../../models/comment'

describe CommentController do
  describe '#create' do
    context 'with valid parameter' do
      it 'create a new comment' do
        comment_controller = CommentController.new
        comment_params = { id: nil, post_id: 5, comment: 'this is #comment' }

        stub_model = double
        mock_comment_return = double
        controller_result = comment_controller.create_comment(comment_params)

        allow(Comment).to receive(:new).with(comment_params).and_return(stub_model)
        allow(stub_model).to receive(:insert_comment).and_return(mock_comment_return)
        allow(mock_comment_return).to receive(:each)

        expect(controller_result).to eq({
                                          'status' => 200,
                                          'message' => 'Success'
                                        })
      end
    end

    context 'with valid parameter' do
      it 'create a new comment' do
        comment_controller = CommentController.new
        comment_params = { id: nil, post_id: nil, comment: 'this is #comment' }

        stub_model = double
        mock_comment_return = double
        controller_result = comment_controller.create_comment(comment_params)

        allow(Comment).to receive(:new).with(comment_params).and_return(stub_model)
        allow(stub_model).to receive(:insert_comment).and_return(mock_comment_return)
        allow(mock_comment_return).to receive(:each)

        expect(controller_result).to eq({
                                          'status' => 400,
                                          'message' => 'Fail'
                                        })
      end
    end
  end
end
