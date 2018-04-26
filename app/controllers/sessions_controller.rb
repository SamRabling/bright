class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/"
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to "/"
  end
end
