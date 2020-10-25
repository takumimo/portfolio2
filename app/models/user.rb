class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 50 }
end
