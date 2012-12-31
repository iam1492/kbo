class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    respond_to do |format|
    	format.html
    	format.json { render_for_api :user_with_comments, 
    		:json => @user, :root => :user }
    end
  end

  def block_user
  	@will_blocked_user_id = params[:user_id]
  	@will_blocked_user = User.find_by_id(@will_blocked_user_id)

  	current_user.follow(@will_blocked_user)
	  meta_data = { :result => "block user success" }
  	respond_to do |format|
    	format.html
    	format.json { render_for_api :user_without_comments, 
    		:json => @will_blocked_user, :root => :user, :meta => meta_data }
    end
  end

  def un_block_user
    @will_unblocked_user_id = params[:user_id]
    @will_unblocked_user = User.find_by_id(@will_unblocked_user_id)

    current_user.stop_following(@will_unblocked_user)
    meta_data = { :result => "unblock user success" }
    respond_to do |format|
      format.html
      format.json { render_for_api :user_without_comments, 
        :json => @will_unblocked_user, :root => :user, :meta => meta_data }
    end
  end

  def get_blocked_user_list
  	@blocked_users = current_user.all_following
  	respond_to do |format|
    	format.html
    	format.json { render_for_api :user_without_comments, 
    		:json => @blocked_users, :root => :user }
    end
  end
end
