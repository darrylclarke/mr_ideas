class CommentsController < ApplicationController
	
	def create
		@comment = Comment.new comment_params
		@idea    = Idea.find params[:idea_id]
		@comment.idea = @idea
		@comment.user = current_user
		@comment.save
		
		redirect_to idea_path(@idea), notice: "Comment Created"
	end
	
private

	def comment_params
		params.require( :comment ).permit( :body )
	end
	
end
