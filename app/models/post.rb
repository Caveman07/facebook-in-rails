class Post < ApplicationRecord
  validates  :body, presence: true, length: { maximum: 500 }

  belongs_to :user
  has_many   :likes
  has_many   :comments

  def liked_by?(user)
    return true if self.likes.find_by(user_id: user.id).present?
  end


  def like_post_by(user)
    unless self.liked_by?(user)
      self.likes.create!(user_id: user.id)
    end
  end

  def count_likes
    self.likes.all.count
  end

  def dislike_post_by(user)
    self.likes.find_by(user_id: user.id).destroy
  end

end
