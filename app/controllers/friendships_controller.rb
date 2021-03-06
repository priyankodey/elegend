class FriendshipsController < ApplicationController
	def create
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	  @friendship.status = "1"
	  if @friendship.save
	    flash[:notice] = "Added friend."
	    redirect_to :back
	  else
	    flash[:error] = "Unable to add friend."
	    redirect_to root_url
	  end
	end

	def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to :back
	end
end
