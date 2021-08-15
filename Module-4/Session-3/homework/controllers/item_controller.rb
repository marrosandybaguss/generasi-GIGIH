require './models/item'
require './models/category'

class ItemController
    def list_items
        items = Item.get_all_items
        renderer = ERB.new(File.read('views/index.erb'))
        renderer.result(binding)
    end

    def create_item_form
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('views/create.erb'))
        renderer.result(binding)
    end

    def create_item(params)
        item = Item.new(nil, params['name'], params['price'])
        item.insert_item_with_category(params['category'])

        list_items
    end

    def show_item(item_id)
        item = Item.get_item_with_category(item_id.to_i)
        renderer = ERB.new(File.read('views/show.erb'))
        renderer.result(binding)
    end

    def edit_item_form(item_id)
        item = Item.get_item_with_category(item_id.to_i)
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('views/edit.erb'))
        renderer.result(binding)
    end

    def edit_item(params)
        item = Item.new(params['id'], params['name'], params['price'])
        item.update_item_with_category(params['category'])

        list_items
    end

    def delete_item(params)
        item = Item.new(params['id'], nil, nil)
        item.delete_item_with_category

        list_items
    end

end