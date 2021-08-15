require_relative '../db/db_connector.rb'

class Comment
    attr_reader :id, :post_id, :comment, :time

    def initialize(id, post_id, comment, time=nil)
        @id = id
        @post_id = post_id
        @comment = comment
        @time = time
    end
    
    def insert_comment
        client = create_db_client
        client.query("INSERT INTO comments (post_id, comment) VALUES (#{@post_id}, '#{@comment}')")
    end
end