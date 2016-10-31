class SessionsController < ApplicationController
  def index
      reset_session
  end

  def login
     user = User.find_by_email(params[:email])

     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to ("/groups/index/#{user.id}")
     else
       flash[:errors] = 'Your login attempt failed!'
       redirect_to :root
     end
  end

  def logout
     session[:user_id] = nil
     redirect_to :root
  end
end
