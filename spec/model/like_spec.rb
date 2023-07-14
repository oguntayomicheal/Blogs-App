require 'rails_helper'

RSpec.describe Like, type: :model do
  before :all do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'This is my first post',
      text: 'This is my first post text',
      likes_counter: 0,
      comments_counter: 0,
      author_id: @user.id
    )
  end
  describe 'Associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('Post')
    end
  end

  describe 'Test the update_likes_counter method' do
    it 'expect the update_likes_counter to return 0' do
      expect(@post.likes_counter).to eq(0)
    end

    it 'updates the likes_counter of the associated post' do
      Like.create(author: @user, post: @post)

      expect(@post.likes_counter).to eq(1)
    end
  end
end
