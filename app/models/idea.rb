class Idea < ActiveRecord::Base
	validates :name, presence: true
	
	belongs_to :user
	
	has_many :comments, dependent: :destroy
	
	has_many :memberships, dependent: :destroy
	has_many :user_members, through: :memberships, source: :user
	
	has_many :likes, dependent: :destroy
	has_many :liking_users, through: :likes, source: :user
	
	def user_name
		if !user
			"Anonymous"
		else
			user.full_name
		end
	end
		
	def ordered_comments
		comments.order(:created_at).reverse
	end
	
	def can_join?( current_user )
		user != current_user
	end
	
	def joined_already?( current_user )
		# byebug
		user_members.include?( current_user )
	end

	def like_for( user )
		likes.find_by_user_id( user.id )
	end
	
	def created_by?( user )
		user_id == user.id
	end

end
