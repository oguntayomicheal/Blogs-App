require 'rails_helper'
RSpec.describe 'User index Page', type: :feature do
  let(:user1) do
    User.create(
      name: 'Tom',
      photo: 'jane.jpg',
      bio: 'sam is a 21 year old footballer from Ghana',
      posts_counter: 2
    )
  end

  let(:user2) do
    User.create(
      name: 'John Doe',
      photo: 'john.jpg',
      bio: 'john is a 21 year old footballer from Ghana',
      posts_counter: 5
    )
  end

  it 'displays users information' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_css('img')

    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{user2.posts_counter}")

    click_link user1.name

    expect(current_path).to eq(user_path(user1))
  end
end
