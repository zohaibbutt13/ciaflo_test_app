class AddReferencesToCampaignTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaign_tags, :campaign, index: true
    add_reference :campaign_tags, :tag,      index: true
  end
end
