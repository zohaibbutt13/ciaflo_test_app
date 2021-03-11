class AddTagIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :tag_id, :integer, foreign_key: { to_table: :tags }
  end
end
