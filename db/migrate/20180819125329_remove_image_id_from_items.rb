class RemoveImageIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image_id, :text
  end
end
