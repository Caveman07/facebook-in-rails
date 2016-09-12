class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"


  def self.send_request(user, friend)
    unless user == friend || Friendship.friendship_exists?(user, friend, "accepted") || Friendship.friendship_exists?(user, friend, "pending")
      transaction do
        create(:user_id => user.id, :friend_id => friend.id, :status => 'pending')
        create(:user_id => friend.id, :friend_id => user.id, :status => 'requested')
      end
    end
  end

  def self.accept(user, friend)
    transaction do
      accept_one_side(user, friend)
      accept_one_side(friend, user)
    end
  end

  def self.accept_one_side(user, friend)
    request = find_by_user_id_and_friend_id(user, friend).first
    request.status = "accepted"
    request.save!
  end

  def self.decline(user, friend)
    find_by_user_id_and_friend_id(user,friend).delete_all
    find_by_user_id_and_friend_id(friend,user).delete_all
  end

  def self.find_by_user_id_and_friend_id(user, friend)
    Friendship.where(["user_id = :user_id AND friend_id = :friend_id", { user_id: user.id, friend_id: friend.id }])
  end

  def self.friendship_exists?(user, friend, status)
    Friendship.where(["user_id = :user_id AND friend_id = :friend_id AND status = :status", { user_id: user.id, friend_id: friend.id, status: status}]).present?
  end

end
