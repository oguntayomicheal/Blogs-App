require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'Jake',
      photo: 'user.png',
      bio: 'Jake is a 21 year old footballer from Ghana'
    )
  end
  let(:post) do
    Post.create(
      author: user,
      title: 'My first post',
      text: 'Ghana is in West Africa'
    )
  end

  describe 'Validations' do
    it 'title should be present' do
      post1 = Post.new(author: user, text: 'Ghana is in West Africa')
      expect(post1).not_to be_valid
      expect(post1.errors[:title]).to include("can't be blank")
    end

    it 'validates maximum length of title' do
      post2 = Post.new(author: user, title: 'A' * 251, text: 'Ghana is in West Africa')
      expect(post2).not_to be_valid
      expect(post2.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'validates numericality of comments_counter' do
      post3 = Post.new(author: user, title: 'My first post', text: 'Ghana is in West Africa',
                       comments_counter: 'not_an_integer')
      expect(post3).not_to be_valid
      expect(post3.errors[:comments_counter]).to include('is not a number')
    end

    it 'validates numericality of likes_counter' do
      post4 = Post.new(author: user, title: 'My first post', text: 'Ghana is in West Africa',
                       likes_counter: 'not_an_integer')
      expect(post4).not_to be_valid
      expect(post4.errors[:likes_counter]).to include('is not a number')
    end
  end

  it 'Should output 5 recent comments when five_recent_comments is called' do
    expect(subject.five_recent_comments.length).to be_between(0, 5)
  end
end
