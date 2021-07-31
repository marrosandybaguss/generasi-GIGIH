require './db/db_connector'
require 'category.rb'

class Item
    attr_reader :id, :name, :price, :category

    def initialize(id, name,  price, category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
    end

    def self.get_all_items
        client = create_db_client
        rawData = client.query("select * from items")
        items = Array.new
    
        rawData.each do |data|
            item = Item.new(data["id"], data["name"], data["price"])
            items.push(item)
        end 
        items
    end

    def self.get_all_items_with_category
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

    def self.get_item_with_category(item_id)
        client = create_db_client
        rawData = client.query("select i.*, c.id as 'category_id', c.name as 'category_name' from items i left join item_categories ic on ic.item_id = i.id left join categories c on c.id = ic.category_id where i.id = #{item_id}")
        item = nil
    
        rawData.each do |data|
            category = Category.new(data["category_id"], data["category_name"])
            item = Item.new(data["id"], data["name"], data["price"], category)
        end 
        item
    end

    def insert_item(name, price)
        client = create_db_client
        client.query("insert into items (name, price) values ('#{name}', #{price})")
    end

    def insert_item_with_category(category)
        client = create_db_client
        row = client.query("insert into items (name, price) values ('#{@name}', #{@price})")
        item_id = client.last_id()
        client.query("insert into item_categories (item_id, category_id) values (#{item_id}, #{category})")
    end

    def update_item_with_category(category)
        client = create_db_client
        client.query("UPDATE items SET name = '#{@name}', price = #{@price} WHERE id = #{@id}")
        client.query("UPDATE item_categories SET category_id = #{category} WHERE item_id = #{@id}")
    end

    def delete_item_with_category
        client = create_db_client
        client.query("DELETE FROM items WHERE id=#{@id}")
        client.query("DELETE FROM item_categories WHERE item_id=#{@id}")
    end

end