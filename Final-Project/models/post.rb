require_relative '../db/db_connector.rb'

class Post
    attr_reader :id, :post, :time

    def initialize(id, post, time=nil)
        @id = id
        @post = post
        @time = time
    end

    def insert_post
        client = create_db_client
        client.query("INSERT INTO posts (post) VALUES ('#{@post}')")
    end

    def self.get_filter_posts(hastagh)
        client = create_db_client
        rawData = client.query("select * from posts where post like '%#{hastagh}%'")
        posts = Array.new
    
        rawData.each do |data|
            post = {:id => data['id'], :post => data['post'], :time => data['reg_date']}
            posts << post
        end 
        posts
    end
end

