# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: author.comments_counter.to_i + 1)
  end
end
