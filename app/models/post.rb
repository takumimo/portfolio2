class Post < ApplicationRecord
	belongs_to :user, optional: true
	has_many :post_comments, dependent: :destroy
	validates :text, presence: true, length: { maximum: 30 }
end
