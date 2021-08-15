require_relative '../models/comment.rb'

class CommentController

    def create_comment(params)
        comments = Comment.new(nil, params['post_id'], params['comment'])
        comments.insert_comment
    end
    
end