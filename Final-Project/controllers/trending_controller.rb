# frozen_string_literal: true

require 'json'
require_relative '../models/post'
require_relative '../models/comment'

class TrendingController
  def trending_hastagh
    posts = Post.select_post_24hours
    comments = Comment.select_comment_24hours
    hastaghs = []
    top = 5

    posts.each do |row|
      post = row[:post]
      hastaghs = containing_hastaghs(hastaghs, post)
    end

    comments.each do |row|
      comment = row[:comment]
      hastaghs = containing_hastaghs(hastaghs, comment)
    end

    trending_hastaghs = produce_top_hastagh(hastaghs, top)
    trending_hastaghs.to_json
  end

  def containing_hastaghs(hastagh_array, data)
    if data.include? '#'
      words = data.split(' ')
      check_similar_hastagh = ''
      words.each do |word|
        if (!check_similar_hastagh.include? word) && (word.include? '#')
          check_similar_hastagh = "#{check_similar_hastagh} #{word}"
          hastagh_array.push(word)
        end
      end
    end
    hastagh_array
  end

  def produce_top_hastagh(hastaghs, top)
    trending_hastaghs = []
    (1..top).each do |i|
      freq = hastaghs.each_with_object(Hash.new(0)) do |v, h|
        h[v] += 1
      end
      most_hastagh = hastaghs.max_by { |v| freq[v] }

      trending = { hastagh: most_hastagh, trending: i }
      trending_hastaghs << trending

      hastaghs.delete(most_hastagh)
    end
    trending_hastaghs
  end
end
