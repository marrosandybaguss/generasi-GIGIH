# frozen_string_literal: true

require 'mysql2'
require 'dotenv'

def create_db_client
  Dotenv.load
  
  Mysql2::Client.new(
    :host => ENV["DB_HOST"],
    :username => ENV["DB_USERNAME"],
    :password => ENV["DB_PASSWORD"],
    :database => ENV["DB_NAME"]
  )
end
