require 'rails_helper'
RSpec.describe 'Posts index Page', type: :feature do
  let(:user) do
    User.create(
      name: 'Jake',
      photo: 'jane.jpg',
      bio: 'Jake is a 21 year old footballer from Ghana'
    )
  end

  it 'displays users information' do
    visit user_posts_path(user)
    expect(page).to have_css('img')
    expect(page).to have_content(user.name)
  end

  it 'displays users posts' do
    post1 = user.posts.create(title: 'Post 1', text: 'Post 1 content', comments_counter: 2, likes_counter: 5)
    post2 = user.posts.create(title: 'Post 2', text: 'Post 2 content', comments_counter: 3, likes_counter: 7)
    post3 = user.posts.create(title: 'Post 3', text: 'Post 3 content', comments_counter: 3, likes_counter: 7)

    visit user_posts_path(user)
    expect(page).to have_content('Number of posts: 3')
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)

    expect(page).to have_content("Comments: #{post1.comments_counter}")
    expect(page).to have_content("Comments: #{post2.comments_counter}")
    expect(page).to have_content("Likes: #{post1.likes_counter}")
    expect(page).to have_content("Likes: #{post2.likes_counter}")
    expect(page).to have_content("Likes: #{post3.likes_counter}")
    
    # When I click on a post, it redirects me to that post's show page.
    click_link post1.title
    expect(current_path).to eq(user_post_path(user, post1))
  end
end
