class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id
    belongs_to :post

    after_save :update_comments_counter

    def update_comments_counter
      post.update(comments_counter: author.comments_counter + 1)
    end
  
    private :update_comments_counter
end
