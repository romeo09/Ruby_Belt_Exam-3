class GroupsController < ApplicationController
  def index
     @user = User.where(id: session[:user_id]).first
     @groups = Group.all
   
  end

  def show
     @user = User.find(session[:user_id])
     @group = Group.where(id: params[:id]).first
     @attendees = Group.first.members
     @members_joined = @attendees.count
  end

  def create
     @user = current_user
     group = Group.new(name: group_params[:name], description: group_params[:description], user_id: session[:user_id] )
      if group.save
         flash["success"] = "Your Organization Has Been Added!"
         redirect_to :back
      else
          flash[:errors] = group.errors.full_messages
          redirect_to :back
      end
  end

  def destroy
     group = Group.destroy(params[:id])
     group.destroy if group.user == current_user
     redirect_to :back
  end

  private
    def group_params
      params.require(:group).permit(:name, :description)
    end
end
