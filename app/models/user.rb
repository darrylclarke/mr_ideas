class User < ActiveRecord::Base
	has_secure_password  
         # password must be there and password_confirmation has to match
	
	has_many :ideas, dependent: :destroy
	has_many :comments, dependent: :nullify
	
	has_many :memberships, dependent: :destroy
	has_many :idea_memberships, through: :memberships, source: :idea
	
	has_many :likes, dependent: :nullify
	has_many :liked_ideas, through: :likes, source: :idea
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	
	validates	:email, presence: true, uniqueness: true,
						format: VALID_EMAIL_REGEX
						
						
	def full_name
		"#{first_name} #{last_name}"						
	end
	
	
	def has_liked_idea?( idea )
		liked_ideas.include?( idea )
	end

end