require 'rails_helper'
RSpec.describe 'Posts show Page', type: :feature do
  let(:user) do
    User.create(
      name: 'Jake',
      photo: 'jane.jpg',
      bio: 'Jake is a 21 year old footballer from Ghana'
    )
  end

  it 'displays post information and comments' do
    post1 = user.posts.create(title: 'Post 1', text: 'Post 1 content', comments_counter: 2, likes_counter: 5)

    visit user_post_path(user, post1)

    expect(page).to have_content(user.name)
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)
    expect(page).to have_content("Comments: #{post1.comments_counter}")
    expect(page).to have_content("Likes: #{post1.likes_counter}")

    # Test for comments
    commentor1 = User.create(name: 'Dan', photo: 'john.jpg', bio: 'John is a 21 year old footballer from Ghana')
    comment1 = Comment.create(author: commentor1, post: post1, text: 'First comment')

    visit user_post_path(user, post1)
    expect(page).to have_content(commentor1.name)
    expect(page).to have_content(comment1.text)
  end
end
