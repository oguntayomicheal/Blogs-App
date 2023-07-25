require 'rails_helper'
RSpec.describe 'User Show Page', type: :feature do
  let(:user) do
    User.create(
      name: 'Jake',
      photo: 'jane.jpg',
      bio: 'Jake is a 21 year old footballer from Ghana'
    )
  end

  it 'displays users information' do
    visit user_path(user)

    expect(page).to have_css('img')
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.bio)
  end

  it 'displays users posts' do
    user.posts.create(title: 'Post 1', text: 'Post 1 content', comments_counter: 2, likes_counter: 5)
    user.posts.create(title: 'Post 2', text: 'Post 2 content', comments_counter: 3, likes_counter: 7)
    user.posts.create(title: 'Post 3', text: 'Post 3 content', comments_counter: 3, likes_counter: 7)

    visit user_path(user)
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_link('See all posts')

    # See all post
    click_link 'See all posts'

    expect(current_path).to eq(user_posts_path(user))
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
  end
end
