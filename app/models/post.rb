class Post < ApplicationRecord
  acts_as_taggable
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true
  validates :emoji, presence: true
  validates :tag_list, presence: true

  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user

  enum status: {doing: 0, done: 1}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def stock(user)
    stocks.create(user_id: user.id)
  end

  # 現在ログインしているユーザーidを受け取り、記事のストックを解除する
  def unstock(user)
    stocks.find_by(user_id: user.id).destroy
  end

  # 記事がストック済みであるかを判定
  # 取得済みであれば true を返す
  def stocked?(user)
    stock_users.include?(user)
  end

end
