# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Daniel',
      photo: 'https://www.w4.org/wp-content/uploads/drupal-images/amaataaidoo.png',
      bio: 'A a career spanning more than five decades'
    )
  end

  before { subject.save }

  it 'validates the presence of a name' do
    subject.name = nil
    expect(subject).not_to be_valid
    expect(subject.errors[:name]).to include("can't be blank")
  end

  it 'Should output 0 to 3 last comment when three_recent_posts is called' do
    expect(subject.three_recent_posts.length).to be_between(0, 3)
  end
end
