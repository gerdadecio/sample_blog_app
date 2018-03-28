require 'rails_helper'

describe PostsController do
  let(:post) { Post.create(name: 'Sample name', body: 'Sample body')}

  describe '#index' do
    before { get :index }
    it 'returns a 200 response' do
      expect(response.code).to eq "200"
    end
  end

  describe '#show' do
    context 'when a post exists' do
      before { get :show, params: { id: post.id } }

      it 'returns a 200 response' do
        expect(response.code).to eq "200"
      end
    end

    context 'when a post does not exist' do
      it 'raises a record not found error' do
        expect { get :show, params: { id: '12323232' } }.to raise_error
      end
    end
  end
end