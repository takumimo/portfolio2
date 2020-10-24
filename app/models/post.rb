class Post < ApplicationRecord
	acts_as_taggable
	belongs_to :user, optional: true
	has_many :post_comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	has_many :tags, dependent: :destroy
	validates :text, presence: true, length: { maximum: 30 }
	
	def liked_by?(user)
    	likes.where(user_id: user.id).exists?
  	end

  	accepts_nested_attributes_for :post_tags, allow_destroy: true

end
