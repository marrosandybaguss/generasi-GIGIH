# frozen_string_literal: true

require_relative '../db/db_connector'

class Comment
  attr_reader :id, :post_id, :comment, :time

  def initialize(id, post_id, comment, time = nil)
    @id = id
    @post_id = post_id
    @comment = comment
    @time = time
  end

  def insert_comment
    client = create_db_client
    client.query("INSERT INTO comments (post_id, comment) VALUES (#{@post_id}, '#{@comment}')")
  end

  def self.select_comment_24hours
    client = create_db_client
    raw_data = client.query('SELECT * FROM comments WHERE reg_date > DATE_SUB(CURDATE(), INTERVAL 1 DAY)')
    comments = []

    raw_data.each do |data|
      comment = { id: data['id'], post_id: data['post_id'], comment: data['comment'],
                  time: data['reg_date'] }
      comments << comment
    end
    comments
  end

  def valid?
    return false if @post_id.nil?
    return false if @comment.nil?
    true
  end
end
