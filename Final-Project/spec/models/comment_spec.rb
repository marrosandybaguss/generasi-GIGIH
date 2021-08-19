# frozen_string_literal: true

require_relative '../../models/comment'

describe Comment do
  describe '#valid?' do
    context 'when initialized with valid input' do
      it 'should return true' do
        comment = Comment.new(nil, 5, 'This is #comment')
        expect(comment.valid?).to eq(true)
      end
    end

    context 'when initialized with invalid input' do
      it 'should return false' do
        comment = Comment.new(5, nil, nil)
        expect(comment.valid?).to eq(false)
      end
    end
  end

  describe '#get data' do
    context 'when execute get all data comment in one day' do
      it 'should return all of data comment in one day' do
        stub_client = double
        stub_query = 'SELECT * FROM comments WHERE reg_date > DATE_SUB(CURDATE(), INTERVAL 1 DAY)'
        comments = [{ "id": 5, "comment_id":5, "comment": 'This is #comment' }]

        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query).and_return(comments)

        result = Comment.select_comment_24hours
        expect(result).not_to be_nil
      end
    end
  end

  describe '#insert data' do
    context 'when executed' do
      it 'should save data' do
        stub_client = double
        stub_query = "INSERT INTO comments (post_id, comment) VALUES (5, 'This is #comment')"
        comment = Comment.new(nil, 5, 'This is #comment')

        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).to receive(:query).with(stub_query)
        comment.insert_comment
      end
    end
  end
end
