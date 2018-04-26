class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(name:params[:name], alias:params[:alias], email:params[:email], password:params[:password], password_confirm:params[:confirm])
    if @user.save
      session[:id] = @user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def show
  end
end
