class Ability
	include CanCan::Ability
	
	def initialize( user )
		user ||= User.new
		
		can :manage, Idea do |i|
			i.user == user
		end
		
		can :manage, Membership do |m|
			m.user == user
		end
		
		can :destroy, Like do |f|
			f.user == user
		end
		
		# can :update, Vote do |v|
		# 	v.user == user
		# end
		
		# if user.admin?
		# 	can :manage, :all
		# end
	end
end 
		