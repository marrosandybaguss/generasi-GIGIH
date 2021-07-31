require './db/db_connector'

class Category
    attr_reader :id, :name, :items

    def initialize(id, name, items=nil)
        @id = id
        @name = name
        @items = items
    end

    def self.get_all_categories
        client = create_db_client
        rawData = client.query("select * from categories")
        categories = Array.new
    
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
            categories.push(category)
        end 
        categories
    end

    def self.get_category(id)
        client = create_db_client
        rawData = client.query("select * from categories where id = #{id}")
        category = nil
    
        rawData.each do |data|
            category = Category.new(data["id"], data["name"])
        end 
        category
    end

    def self.get_all_categories_with_item
        client = create_db_client
        rawData = client.query("select c.name, group_concat(i.name) as 'Items' from categories c left join item_categories ic on ic.category_id = c.id left join items i on i.id = ic.item_id group by c.id")
        categories = Array.new
    
        rawData.each do |data|
            category = Category.new(data["id"], data["name"], data["Items"])
            categories.push(category)
        end 
        categories
    end

    def insert_category
        client = create_db_client
        client.query("insert into categories (name) values ('#{@name}')")
    end

    def update_category
        client = create_db_client
        client.query("UPDATE categories SET name = '#{@name}' WHERE id = #{@id}")
    end

    def delete_category
        client = create_db_client
        client.query("DELETE FROM categories WHERE id=#{@id}")
        client.query("DELETE FROM item_categories WHERE category_id=#{@id}")
    end

    def valid?
        return false if @id.nil?
        return false if @name.nil?
        true
    end
  
end

puts Category.get_all_categories