class CampaignsController < ApplicationController
  before_action :load_resource, only: [:add_comment]

  def create
    @campaign = @current_user.campaigns.create(campaign_params)
    if @campaign.valid?
      render json: { campaign: @campaign }
    else
      render json: { error: @campaign.errors.full_messages }
    end
  end

  def add_comment
    comments_params           = campaign_params[:comment]
    comments_params[:user_id] = @current_user.id
    @comment = @campaign.comments.create(comments_params)
    if @comment.valid?
      render json: { comment: @comment }
    else
      render json: { error: @comment.errors.full_messages }
    end
  end

  private

  def load_resource
    @campaign = Campaign.find_by(id: campaign_params[:id])
    render json: { message: 'Invalid Camapign ID' }, status: :unauthorized if @campaign.blank?
  end

  def campaign_params
    params.permit(
      :id,
      :title,
      :purpose,
      :estimated_duration,
      comment: [
        :body
      ]
    )
  end
end
