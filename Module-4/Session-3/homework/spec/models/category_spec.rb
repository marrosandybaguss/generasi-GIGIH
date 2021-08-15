require "./models/category"

describe Category do
    describe '#valid?' do
        context "when initialized with valid input" do
            it 'should return true' do
                category = Category.new(5, "Beverage")
                expect(category.valid?).to eq(true)
            end
        end

        context "when initialized with invalid input" do
            it 'should return false' do
                category = Category.new(nil, "Bevarage")
                expect(category.valid?).to eq(false)
            end
        end
    end

    describe '#get data' do
        context "when execute get all data category" do
            it 'should return all of data category' do
                stub_client = double
                stub_query = 'select * from categories'
                categories = [{ "id": 5, "name": 'Baverage' }]

                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                expect(stub_client).to receive(:query).with(stub_query).and_return(categories)

                result = Category.get_all_categories
                expect(result).not_to be_nil
            end
        end

        context "when execute get single data category" do
            it 'should return a data of category' do
                stub_client = double
                stub_query = 'select * from categories where id = 5'
                category = [{ "id": 5, "name": 'Baverage' }]

                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                expect(stub_client).to receive(:query).with(stub_query).and_return(category)

                result = Category.get_category(5)
                expect(result).not_to be_nil
            end
        end

        # context "when execute get all data category with category" do
        #     it 'should return all of data category with item' do
        #         stub_client = double
        #         stub_query = 'select c.name, group_concat(i.name) as "Items" from categories c left join item_categories ic on ic.category_id = c.id left join items i on i.id = ic.item_id group by c.id'
        #         categories = [{ "name": 'Baverage', "Items": '["Jus", "Water", "Noodles"]' }]

        #         allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        #         expect(stub_client).to receive(:query).with(stub_query).and_return(categories)

        #         result = Category.get_all_categories_with_item
        #         expect(result).not_to be_nil
        #     end
        # end
    end
    
    describe '#insert data' do
        context 'when executed' do
            it 'should save data' do
                stub_client = double
                stub_query = "insert into categories (name) values ('Bevarage')"
                category = Category.new(5, 'Bevarage')

                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                expect(stub_client).to receive(:query).with(stub_query)
                category.insert_category
            end
        end
    end

    describe '#update' do
        context 'when executed' do
            it 'should change selected data' do
                stub_client = double
                stub_query_1 = "UPDATE categories SET name = 'Bevarage' WHERE id = 5"
                category = Category.new(5, 'Bevarage')

                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                expect(stub_client).to receive(:query).with(stub_query_1)
                category.update_category
            end
        end
    end

    describe '#delete' do
        context 'when executed' do
            it 'should delete selected data' do
                stub_client = double
                stub_query = "DELETE FROM categories WHERE id=5"
                stub_query_2 = "DELETE FROM item_categories WHERE category_id=5"
                category = Category.new(5, "Bevarage")

                allow(Mysql2::Client).to receive(:new).and_return(stub_client)
                expect(stub_client).to receive(:query).with(stub_query)
                expect(stub_client).to receive(:query).with(stub_query_2)
                category.delete_category
            end
        end
    end
end