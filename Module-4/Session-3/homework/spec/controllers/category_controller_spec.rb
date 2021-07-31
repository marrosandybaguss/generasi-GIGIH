require "./controllers/category_controller"
require "./models/category"

describe Category do
    describe '#show' do
        it 'should show index category page' do
            controller = CategoryController.new

            response = controller.list_categories

            categories = Category.get_all_categories
            expected_view = ERB.new(File.read('./views/index_category.erb')).result(binding)
            expect(response).to eq(expected_view)
        end

        it 'should show category with item page' do
            controller = CategoryController.new

            response = controller.list_categories_with_item

            categories = Category.get_all_categories_with_item
            expected_view = ERB.new(File.read('./views/category_with_item.erb')).result(binding)
            expect(response).to eq(expected_view)
        end

        it 'should show category form page' do
            controller = CategoryController.new

            response = controller.create_category_form

            expected_view = ERB.new(File.read('./views/create_category.erb')).result(binding)
            expect(response).to eq(expected_view)
        end 

        # it 'should show edit category form page' do
        #     controller = CategoryController.new

        #     idParam = "5"
        #     response = controller.edit_category_form(idParam)
            
        #     category = Category.get_category(idParam.to_i)
        #     expected_view = ERB.new(File.read('./views/edit_category.erb')).result(binding)
        #     expect(response).to eq(expected_view)
        # end 
    end

    # describe "#create" do
    #     context "with valid parameter" do
    #         it "create a new category" do
    #             stub = double
                
    #             controller = CategoryController.new
    #             params = {
    #                 "id"=> 5,
    #                 "name"=> "Beverage"
    #             }
    #             category = Category.new(nil, params['name'])
    
    #             expect(Category).to receive(:new).with(params).and_return(stub)
    #             expect(stub).to receive(:save)
    
    #             controller.create_category(params)
    #             category.insert_category
    #         end
    #     end
    # end
    
end