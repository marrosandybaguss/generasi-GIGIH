# frozen_string_literal: true

require_relative '../db/db_connector'

class Post
  attr_reader :id, :post, :time

  def initialize(id, post, time = nil)
    @id = id
    @post = post
    @time = time
  end

  def insert_post
    client = create_db_client
    client.query("INSERT INTO posts (post) VALUES ('#{@post}')")
  end

  def self.select_filter_posts(hastagh)
    client = create_db_client
    raw_data = client.query("select * from posts where post like '%#{hastagh}%'")
    posts = []

    raw_data.each do |data|
      post = { id: data['id'], post: data['post'], time: data['reg_date'] }
      posts << post
    end
    posts
  end

  def self.select_post_24hours
    client = create_db_client
    raw_data = client.query('SELECT * FROM posts WHERE reg_date > DATE_SUB(CURDATE(), INTERVAL 1 DAY)')
    posts = []

    raw_data.each do |data|
      post = { id: data['id'], post: data['post'], time: data['reg_date'] }
      posts << post
    end
    posts
  end
end
