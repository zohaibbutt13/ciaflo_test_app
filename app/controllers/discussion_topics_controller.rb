class DiscussionTopicsController < ApplicationController
  before_action :load_resource, only: [:create]

  def create
    @discussion_topic = @current_user.discussion_topic.create(discussion_topic_params)
    if @discussion_topic.valid?
      render json: { discussion_topic: @discussion_topic }
    else
      render json: { error: @discussion_topic.errors.full_messages }
    end
  end

  private

  def load_resource
    @campaign = Campaign.find_by(id: discussion_topic_params[:campaign_id])
    render json: { message: 'Invalid Campaign ID' }, status: :unauthorized if @campaign.blank?
  end

  def discussion_topic_params
    params.permit(:title, :campaign_id)
  end
end
