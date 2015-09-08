class MembershipsController < ApplicationController

	before_action :authenticate_user!
	before_action :find_idea

	def create
		membership = Membership.new( user: current_user, idea: @idea )
		
		if membership.save
			redirect_to root_path, notice: "You joined!"
		else
			redirect_to root_path, alert: "Can't join."
		end
	end
	
	def destroy
		# render json: params
		membership = current_user.memberships.find_by_idea_id params[:idea_id]
		# byebug
		if can? :destroy, membership
			membership.destroy
			redirect_to root_path, notice: "No longer joined."
		else
			redirect_to root_path, alert: "Access Denied."			
		end
	end

private

	def find_idea
		@idea = Idea.find params[:idea_id]
	end	
	
end
