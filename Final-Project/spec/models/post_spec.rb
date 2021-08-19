# frozen_string_literal: true

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

  describe '#get data' do
    context 'when execute get all data post apropiate hastagh' do
      it 'should return all of data post apropiate hastagh' do
        stub_client = double
        hastagh = '#post'
        stub_query = "select * from posts where post like '%#{hastagh}%'"
        posts = [{ "id": 5, "post": 'This is #post' }]

        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query).and_return(posts)

        result = Post.select_filter_posts(hastagh)
        expect(result).not_to be_nil
      end
    end
  end
end
