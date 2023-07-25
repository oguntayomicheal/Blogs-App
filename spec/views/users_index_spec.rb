require 'rails_helper'
RSpec.describe 'User index Page', type: :feature do
  scenario 'displays users information' do
    user1 = User.create(name: 'John Doe', photo: 'john.jpg', bio: 'John Doe from Ghana', posts_counter: 5)
    user2 = User.create(name: 'Jane Smith', photo: 'jane.jpg', bio: 'John Doe from Ghana', posts_counter: 10)

    visit users_path(user1)
    expect(page).to have_content(user1.name)
    visit users_path(user2)
    expect(page).to have_content(user2.name)
    expect(page).to have_css('img')

    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{user2.posts_counter}")

    click_link user1.name

    expect(current_path).to eq(user_path(user1))
  end
end
