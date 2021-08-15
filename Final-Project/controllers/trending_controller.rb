require "json"
require_relative '../models/post.rb'
require_relative '../models/comment.rb'

class TrendingController

    def trending_hastagh
        posts = Post.get_post_24hours
        comments = Comment.get_comment_24hours
        hastaghs = Array.new
        top = 5
        trendingHastaghs = Array.new

        posts.each do |row|
            post = row[:post]
            containing_hastaghs(hastaghs, post)
        end

        comments.each do |row|
            comment = row[:comment]
            containing_hastaghs(hastaghs, comment)
        end
        
        produce_top_hastagh(trendingHastaghs, hastaghs, top)

        trendingHastaghs.to_json
    end

    def containing_hastaghs(hastaghArray, data)
        if data.include? "#"
            # split data menjadi kata per kata
            words = data.split(' ')
            checkSimilarHastagh = ''
            words.each do |word|
                # get instance hastagh
                if word.include? "#"
                    # get one similiar hastagh
                    if checkSimilarHastagh.include? word
                    else
                        checkSimilarHastagh = checkSimilarHastagh + " " + word
                        hastaghArray.push(word)
                    end
                end
            end
        end
    end

    def produce_top_hastagh(trendingHastaghs, hastaghs, top)
        for i in 1..top
            freq = hastaghs.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
            mostHastagh = hastaghs.max_by { |v| freq[v] }
            
            trending = {:hastagh => mostHastagh, :trending => i}
            trendingHastaghs << trending
            
            hastaghs.delete(mostHastagh)
         end
    end

    
end