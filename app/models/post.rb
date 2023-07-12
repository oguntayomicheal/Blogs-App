class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_posts_counter

  def update_posts_counter
    author.update(posts_counter: author.posts_counter.to_i + 1)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private :update_posts_counter
end
