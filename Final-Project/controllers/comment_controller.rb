# frozen_string_literal: true

require_relative '../models/comment'

class CommentController
  def create_comment(params)
    comments = Comment.new(nil, params[:post_id], params[:comment])
    response = comments.insert_comment
    if response
      return {
        'status' => 200,
        'message' => 'Success'
      }
    else
      return {
        'status' => 400,
        'message' => 'Fail'
      }
    end
  end
end
