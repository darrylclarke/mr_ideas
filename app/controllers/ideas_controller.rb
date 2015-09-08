class IdeasController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :find_idea, only:   [:show, :edit, :update, :destroy]
	before_action :authorize!,         only:   [:edit, :update, :destroy]
 
 
  def authorize!
    redirect_to root_path, message: "Access Denied." unless can? :manage, @idea
  end
  
  def new
    @idea = Idea.new
  end

  def index
    # if params[:filter] == "favourites"
      # @ideas = current_user.favourite_ideas.order(:created_at)
    # else
      @ideas = Idea.all.order(:created_at).reverse
      @idea  = Idea.new
    # end
  end
  
  
   def create
    @idea = Idea.new( idea_params )
    @idea.user = current_user
    
    if @idea.save
      redirect_to root_path, notice: "Idea Created."
      # redirect_to idea_path( @idea ), notice: "Idea Created."
    else
      flash[ :alert ] = "See errors below:"
      render :new
    end
  end
  
  
  def show
    # @comment = Comment.new
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to root_path
      # redirect_to idea_path( @idea )
    else
      render :edit
    end
  end
  
  def destroy
    @idea.destroy
    redirect_to ideas_path(@idea)
  end
 
 private
 
    def find_idea
      @idea = Idea.find params[:id]
    end
 
    def idea_params
      params.require(:idea).permit( :name, :body ) 
    end
end
