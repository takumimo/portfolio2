class Post < ApplicationRecord
	acts_as_taggable
	belongs_to :user, optional: true
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	validates :title, presence: true
	validates :text, presence: true, length: { maximum: 200 }

	def liked_by?(user)
    	likes.where(user_id: user.id).exists?
  	end
end
