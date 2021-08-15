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
end

