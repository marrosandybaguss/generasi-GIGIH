# frozen_string_literal: true

require 'json'
require_relative '../models/post'

class PostController
  def create_post(params)
    posts = Post.new(nil, params[:post])
    response = posts.insert_post
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

  def list_filter_posts(hastagh)
    posts = Post.select_filter_posts(hastagh)
    posts.to_json
  end
end
