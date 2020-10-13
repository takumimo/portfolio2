class Post < ApplicationRecord
	belongs_to :user, optional: true
	validates :text, presence: true, length: { maximum: 3 }
end
