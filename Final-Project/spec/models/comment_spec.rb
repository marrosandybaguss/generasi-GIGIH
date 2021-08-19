# frozen_string_literal: true

require_relative '../../models/comment'

describe Comment do
  describe '#valid?' do
    context 'when initialized with valid input' do
      it 'should return true' do
        comment = Comment.new(5, 'This is #comment')
        expect(comment.valid?).to eq(true)
      end
    end

    context 'when initialized with invalid input' do
      it 'should return false' do
        comment = Comment.new(5, nil)
        expect(comment.valid?).to eq(false)
      end
    end
  end
end