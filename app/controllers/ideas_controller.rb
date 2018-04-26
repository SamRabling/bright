class IdeasController < ApplicationController
  before_action :require_user
  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.new(post:params[:post])
    @idea.user = current_user
    if @idea.save
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @idea.errors.full_messages
      redirect_to "/bright_ideas"
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def delete
    @idea = Idea.find(params[:id])
    if @idea.user == current_user
        @idea.destroy
    end
    redirect_to "/bright_ideas"
  end

  def like
    @user = current_user
    @idea = Idea.find(params[:id])
    @like = Like.create(user_id: @user.id, idea_id: @idea.id)
    redirect_to "/bright_ideas"
    
  end

  private
  def require_user
    if current_user
      true
    else
      redirect_to "/"
    end
  end
end
