class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  
  validates :body, presence: true
  
  	def user_name
		if !user
			"Anonymous"
		else
			user.full_name
		end
	end
  
end
