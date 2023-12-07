class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :favorites

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  has_many :followees, through: :followed_users, source: :followee

  has_many :follower_users, foreign_key: :followee_id, class_name: "Following"
  has_many :followers, through: :follower_users, source: :follower


  def follows?(other_user)
    self.followees.include?(other_user)
  end

  def follow(other_user)
    self.followees << other_user unless self.follows?(other_user)
  end

  def unfollow(other_user)
    self.followees.delete(other_user)
  end

end
