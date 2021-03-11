class DiscussionTopicsController < ApplicationController
  before_action :load_campaign, only: [:create]
  before_action :load_discussion_topic, only: [:add_comment]

  def create
    @discussion_topic = @current_user.discussion_topic.create(discussion_topic_params)
    if @discussion_topic.valid?
      render json: { discussion_topic: @discussion_topic }
    else
      render json: { error: @discussion_topic.errors.full_messages }
    end
  end

  def add_comment
    comments_params           = discussion_topic_params[:comment]
    comments_params[:user_id] = @current_user.id
    @comment = @discussion_topic.comments.create(comments_params)
    if @comment.valid?
      render json: { comment: @comment }
    else
      render json: { error: @comment.errors.full_messages }
    end
  end

  private

  def load_campaign
    @campaign = Campaign.find_by(id: discussion_topic_params[:campaign_id])
    render json: { message: 'Invalid Campaign ID' }, status: :unauthorized if @campaign.blank?
  end

  def load_discussion_topic
    @discussion_topic = DiscussionTopic.find_by(id: discussion_topic_params[:id])
    render json: { message: 'Invalid Discussion Topic ID' }, status: :unauthorized if @discussion_topic.blank?
  end

  def discussion_topic_params
    params.permit(
      :id,
      :title,
      :campaign_id,
      comment: [
        :body
      ]
    )
  end
end
