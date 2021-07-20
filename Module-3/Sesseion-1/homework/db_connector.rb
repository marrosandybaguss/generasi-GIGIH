require 'mysql2'
require_relative 'item.rb'
require_relative 'category.rb'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "mypassword",
        :database => "food_oms_db"
    )
    client
end

def get_all_items
    client = create_db_client
    rawData = client.query("select * from items")
    items = Array.new

    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end 
    items
end

def get_all_categories
    client = create_db_client
    rawData = client.query("select * from categories")
    categories = Array.new

    rawData.each do |data|
        category = Category.new(data["id"], data["name"])
        categories.push(category)
    end 
    categories
end

def get_all_items_with_category
    client = create_db_client
    rawData = client.query("select i.*, c.id as 'category_id', c.name as 'category_name' from items i left join item_categories ic on ic.item_id = i.id left join categories c on c.id = ic.category_id")
    items = Array.new

    rawData.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Item.new(data["id"], data["name"], data["price"], category)
        items.push(item)
    end 
    items
end

def get_items(price)
    client = create_db_client
    items = client.query("select * from items where price < #{price}")
end

def insert_item(name, price)
    client = create_db_client
    client.query("insert into items (name, price) values ('#{name}', #{price})")
end

def insert_item_with_category(name, price, category)
    client = create_db_client
    row = client.query("insert into items (name, price) values ('#{name}', #{price})")
    item_id = client.last_id()
    client.query("insert into item_categories (item_id, category_id) values (#{item_id}, #{category})")
end

def get_item_with_category(item_id)
    client = create_db_client
    rawData = client.query("select i.*, c.id as 'category_id', c.name as 'category_name' from items i left join item_categories ic on ic.item_id = i.id left join categories c on c.id = ic.category_id where i.id = #{item_id}")
    item = nil

    rawData.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Item.new(data["id"], data["name"], data["price"], category)
    end 
    item
end

def update_item_with_category(id, name, price, category)
    client = create_db_client
    client.query("UPDATE items SET name = '#{name}', price = #{price} WHERE id = #{id}")
    client.query("UPDATE item_categories SET category_id = #{category} WHERE item_id = #{id}")
end