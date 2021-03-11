class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :purpose
      t.string :estimated_duration

      t.timestamps
    end
  end
end
