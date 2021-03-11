class CommentsController < ApplicationController
  before_action :load_resource

  def create
    @comment = @resource.comments.create(comment_params)
    if @comment.valid?
      render json: { comment: @comment }
    else
      render json: { error: @comment.errors.full_messages }
    end
  end

  private

  def load_resource
    if comment_params[:commentable_type] == 'DiscussionTopic'
      @resource = DiscussionTopic.find_by(id: comment_params[:commentable_id])
    elsif comment_params[:commentable_type] == 'Campaign'
      @resource = Campaign.find_by(id: comment_params[:commentable_id])
    end
    render json: { message: 'Invalid Resource Data' }, status: :unauthorized if @resource.blank?
  end

  def comment_params
    params.permit(:body, :commentable_type, :commentable_id)
  end
end
