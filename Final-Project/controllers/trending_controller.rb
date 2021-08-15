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
            # one post
            post = row[:post]
            # post with hastagh will process
            if post.include? "#"
                # split post menjadi kata per kata
                words = post.split(' ')
                checkSimilarHastagh = ''
                words.each do |word|
                    # get instance hastagh
                    if word.include? "#"
                        # get one similiar hastagh
                        if checkSimilarHastagh.include? word
                        else
                            checkSimilarHastagh = checkSimilarHastagh + " " + word
                            hastaghs.push(word)
                        end
                    end
                end
            end
        end

        comments.each do |row|
            # one comment
            comment = row[:comment]
            # comment with hastagh will process
            if comment.include? "#"
                # split comment menjadi kata per kata
                words = comment.split(' ')
                checkSimilarHastagh = ''
                words.each do |word|
                    # get instance hastagh
                    if word.include? "#"
                        # get one similiar hastagh
                        if checkSimilarHastagh.include? word
                        else
                            checkSimilarHastagh = checkSimilarHastagh + " " + word
                            hastaghs.push(word)
                        end
                    end
                end
            end
        end

        for i in 1..top
            # get hastagh terbanyak
            freq = hastaghs.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
            mostHastagh = hastaghs.max_by { |v| freq[v] }
            # assign in array trendinghastagh
            trending = {:hastagh => mostHastagh, :trending => i}
            trendingHastaghs << trending
            # delete hastagh terbanyak, sehingga didapatkan hastagh terbanyak berikutnya
            hastaghs.delete(mostHastagh)
         end
         

        trendingHastaghs.to_json
    end
    
end