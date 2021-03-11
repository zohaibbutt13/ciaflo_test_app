class AddColumnsToComments < ActiveRecord::Migration[5.1]
  def change
    add_column    :comments, :commentable_type, :string
    add_column    :comments, :commentable_id,   :integer
    add_reference :comments, :user, index: true

    add_index     :comments, :commentable_type
    add_index     :comments, :commentable_id
  end
end
