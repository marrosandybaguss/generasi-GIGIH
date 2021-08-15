require_relative '../models/post.rb'

class PostController
    
    def create_post(params)
        posts = Post.new(nil, params['post'])
        posts.insert_post
    end

end

