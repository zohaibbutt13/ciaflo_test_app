class CreateCampaignTags < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_tags do |t|
      t.timestamps
    end
  end
end
