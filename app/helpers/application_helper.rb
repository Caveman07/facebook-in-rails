module ApplicationHelper
  def current_user?(user)
    return true if current_user == user
  end

  def count_all_likes_of_posts_by (user)
      likes = 0
      user.posts.each do |post|
        likes += post.likes.count
      end
      likes
  end

  def count_all_comments_of_posts_by (user)
      comments = 0
      user.posts.each do |post|
        comments += post.comments.count
      end
      comments
    end

end
