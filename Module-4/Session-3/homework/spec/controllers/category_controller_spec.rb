require "./controllers/category_controller"
require "./models/category"

describe Category do
    describe '#show' do
        it 'should show tes page' do
            controller = CategoryController.new

            response = controller.show

            expected_view = ERB.new(File.read('./views/tes.erb'))
            expect(response).to eq(expected_view.result)
        end

        it 'should show index page' do
            controller = CategoryController.new

            response = controller.list_categories

            categories = Category.get_all_categories
            expected_view = ERB.new(File.read('./views/index_category.erb')).result(binding)
            expect(response).to eq(expected_view)
        end
    end
    
end