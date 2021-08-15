require "./models/category"

describe Category do
    describe '#valid?' do
        context "when initialized with valid input" do
            it 'should return true' do
                category = Category.new(5, "Beverage")
                expect(category.valid?).to eq(true)
            end
        end
    end
    
end