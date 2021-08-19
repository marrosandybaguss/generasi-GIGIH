require_relative '../../models/post'

describe Post do
  describe '#valid?' do
    context 'when initialized with valid input' do
      it 'should return true' do
        post = Post.new(5, 'This is #post')
        expect(post.valid?).to eq(true)
      end
    end

    context 'when initialized with invalid input' do
      it 'should return false' do
        post = Post.new(5, nil)
        expect(post.valid?).to eq(false)
      end
    end
  end
end
