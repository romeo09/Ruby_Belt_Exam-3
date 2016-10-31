class JoinsController < ApplicationController
  def create
     group = Group.find(params[:group_id])
     members = Join.create(user: current_user, group: group )
     redirect_to :back
  end

  def destroy
     join = Join.where(group_id: params['group_id'], user_id: session[:user_id]).first.destroy
     redirect_to :back
  end
end
