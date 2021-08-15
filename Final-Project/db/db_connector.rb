require 'mysql2'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "mypassword",
        :database => "tes_final_project"
    )
    client
end


