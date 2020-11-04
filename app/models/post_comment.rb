class PostComment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	has_many :thanks, dependent: :destroy

	def thanked_by?(user)
    	thanks.where(user_id: user.id).exists?
  	end
end
