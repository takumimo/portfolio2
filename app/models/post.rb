class Post < ApplicationRecord
  acts_as_taggable
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true, length: { maximum: 200 }

  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user

  enum status: {doing: 0, done: 1}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
