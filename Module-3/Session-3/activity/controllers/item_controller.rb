require_relative '../models/item.rb'
require_relative '../models/category.rb'

class ItemController
    def list_items
        items = Item.get_all_items
        renderer = ERB.new(File.read('views/index.erb'))
        renderer.result(binding)
    end

    def create_item(params)
        item = Item.new(nil, params['name'], params['price'])
        item.insert_item_with_category(params['category'])

        list_items
    end

    def create_item_form
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('views/create.erb'))
        renderer.result(binding)
    end

    def show_item(item_id)
        items = Item.get_item_with_category(item_id.to_i)
        renderer = ERB.new(File.read('views/show.erb'))
        renderer.result(binding)
    end

end