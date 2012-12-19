class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    respond_to do |format|
    	format.html
    	format.json { render_for_api :user_with_comments, 
    		:json => @user, :root => :user }
    end
  end
end
