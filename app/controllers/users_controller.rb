class UsersController < ApplicationController
   before_action :require_login, except: [:new, :create]
   before_action :require_correct_user, only: [:destroy]
  def new
     render :new
  end

  def create
     @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to ("/groups/index/#{@user.id}")
     else
       flash[:errors] = @user.errors.full_messages
       redirect_to :back
     end
  end

  def destroy
     @user = User.destroy(params[:id])
     session[:user_id] = nil
     redirect_to :root
  end

  private
    def user_params
     params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end 
end
