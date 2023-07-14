# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, foreign_key: :post_id

  after_save :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes_counter.to_i + 1)
  end

  private :update_likes_counter
end
