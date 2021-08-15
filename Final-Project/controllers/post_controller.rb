require "json"
require_relative '../models/post.rb'

class PostController
    
    def create_post(params)
        posts = Post.new(nil, params['post'])
        posts.insert_post
    end

    def list_posts_with_hastagh(hastagh)
        posts = Post.get_all_posts
        postsFiltered = Array.new

        posts.each do |row|
            post = row[:post]
            if post.include? "#{hastagh}"
                postFiltered = {:id => row[:id], :post => post, :time => row[:time]}
                postsFiltered << postFiltered
            end
        end

        postsFiltered.to_json
    end

end

