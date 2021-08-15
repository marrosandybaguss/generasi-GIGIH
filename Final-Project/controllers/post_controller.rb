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

    def trending_hastagh
        posts = Post.get_post_24hours
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
                # break
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

