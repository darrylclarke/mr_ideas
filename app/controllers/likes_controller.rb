class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_idea
	
	def create
		# l = Like.new
		# l.user = current_user
		# l.idea = q
		# above three lines ==>
		l = Like.new( idea: @idea, user: current_user ) # shorter <==
		
		if l.save
			#redirect_to idea_path(q), notice: "Liked!"
			redirect_to @idea, notice: "Liked!"   # Rails re-directs to 'show' path of idea with idea ID
		else
			#redirect_to idea_path(q), alert: "Can't Like"
			redirect_to @idea, alert: "Can't Like"
		end
	end
	
	def destroy
		#like    = current_user.likes.find params[:id] ==> one solution
		like = Like.find params[:id]
		if can? :destroy, like
			like.destroy
			redirect_to	@idea,          # same as ==> idea_path( idea ),
						notice: "Un-liked"
		else
			redirect_to root_path, alert: "Access Denied" 
		end
	end
	
private
	def find_idea
		@idea = Idea.find params[:idea_id]
	end
end
