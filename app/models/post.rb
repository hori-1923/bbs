class Post < ActiveRecord::Base
	#validates :name, 	presence: true,
	#					length: { in: 3..100 }
	belongs_to :user
	validates :title, 	presence: true,
						length: { in: 3..100 }
end
