class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_comments_counter

  private

  attribute :comments_counter, :integer, default: 0

  def update_comments_counter
    post.update(comments_counter: post.comments_counter.to_i + 1)
  end
end
