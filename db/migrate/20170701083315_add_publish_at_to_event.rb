class AddPublishAtToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :published_at, :string
  end
end
