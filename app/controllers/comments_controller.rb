class CommentsController < ApplicationController
  respond_to :json

  def show
    @comment = Comment.find(params[:id])
    respond_with @comment, :api_template => :user_with_comments
  end

  def get_comments
    @team_idx = params[:team_idx]
    @comment = Comment.getComments(@team_idx, 200);
    respond_with @comment, :api_template => :user_with_comments
  end

  def get_more_comments
    @createdAt = params[:created_at]
    @team_idx = params[:team_idx]
    @comment = Comment.getMoreComments(@createdAt, @team_idx)
    respond_with @comment, :api_template => :user_with_comments
  end

  def create
    p_comment = params[:comment][:comment]
    p_team_idx = params[:comment][:team_idx]
    
    if request.format != :json
      render :status=>406, :json=>{:metadata => {:success => false, :message=>"The request must be json"}}
      return
    end

    if p_comment.nil? or p_team_idx.nil?
      render :status=>400,:json=> {:metadata => {:success => false, :message=>"The request must contain the comment and team idx."}}
    return
    end

    @comment = Comment.create(params[:comment])

    if @comment.nil?
      render :status=>401, :json=>{:metadata => {:success => false, :message=>"fail to create comment."}}
      return
    else
      render :status=>200, :json=>{:metadata => {:success => true, :message=>"success to create comment."}}
      return  		
    end
  end
end
