require "json"
require_relative '../models/post.rb'

class PostController
    
    def create_post(params)
        posts = Post.new(nil, params['post'])
        posts.insert_post
    end

    def list_filter_posts(hastagh)
        posts = Post.get_filter_posts(hastagh)
        posts.to_json
    end

end

