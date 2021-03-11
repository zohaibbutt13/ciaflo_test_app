class CampaignTag < ApplicationController
  before_action :load_resources, only: [:create]

  def create
    @campaign_tag = CampaignTag.create(campaign_tag_params)
    if @campaign_tag.valid?
      render json: { campaign_tag: @campaign_tag }
    else
      render json: { error: @campaign_tag.errors.full_messages }
    end
  end

  private

  def load_resources
    @campaign = Campaign.find_by(id: add_tag_params[:campaign_id])
    @tag      = Tag.find_by(id: add_tag_params[:tag_id])
    render json: { message: 'Invalid Campaign ID or Tag ID' }, status: :unauthorized if @campaign.blank? || @tag.blank?
  end

  def campaign_tag_params
    params.permit(:campaign_id, :tag_id)
  end
end