class CampaignsController < ApplicationController

  def create
    @campaign = @current_user.campaigns.create(campaign_params)
    if @campaign.valid?
      render json: { campaign: @campaign }
    else
      render json: { error: @campaign.errors.full_messages }
    end
  end

  private

  def campaign_params
    params.permit(:title, :purpose, :estimated_duration)
  end
end
