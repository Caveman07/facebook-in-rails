class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  #associations
  has_many :friends, -> { where friendships: { status: 'accepted' }  }, :through => :friendships
  has_many :friendships,  :dependent => :destroy
  has_many :pending_friends, -> { where friendships: { status: 'pending' }  }, :through => :friendships, :source => :friend, :class_name => "User", :dependent => :destroy
  has_many :requested_friends, -> { where friendships: { status: 'requested' }  }, :through => :friendships,:source => :friend,  :class_name => "User"
  has_many :posts, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates_uniqueness_of :email, :case_sensitive => false
  validate :avatar_size

  #avatar uploader
  mount_uploader :avatar, AvatarUploader


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def age
    age = Date.today.year - self.dob
  end

  def collect_feed
    friends_ids = "SELECT friend_id FROM friendships
                     WHERE  user_id = :user_id"
    Post.where("user_id IN (#{friends_ids}) OR user_id = :user_id", user_id: id).order(created_at: :desc)
  end


    private

    def avatar_size
      if avatar.size > 5.megabytes
        errors.add(:avatar, "should be less than 5MB")
      end
    end

end
