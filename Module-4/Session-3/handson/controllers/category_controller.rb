require './models/category'

class CategoryController
    def show
        renderer = ERB.new(File.read('./views/tes.erb'))
        renderer.result(binding)
    end

    def list_categories
        categories = Category.get_all_categories
        renderer = ERB.new(File.read('./views/index_category.erb'))
        renderer.result(binding)
    end

    def list_categories_with_item
        categories = Category.get_all_categories_with_item
        renderer = ERB.new(File.read('./views/category_with_item.erb'))
        renderer.result(binding)
    end

    def create_category_form
        renderer = ERB.new(File.read('./views/create_category.erb'))
        renderer.result(binding)
    end

    def create_category(params)
        category = Category.new(nil, params['name'])
        category.insert_category

        list_categories
    end

    def edit_category_form(id)
        category = Category.get_category(id.to_i)
        renderer = ERB.new(File.read('./views/edit_category.erb'))
        renderer.result(binding)
    end

    def edit_category(params)
        category = Category.new(params['id'], params['name'])
        category.update_category

        list_categories
    end

    def delete_category(params)
        category = Category.new(params['id'], nil)
        category.delete_category

        list_categories
    end
    
end