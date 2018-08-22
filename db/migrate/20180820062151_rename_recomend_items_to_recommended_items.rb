class RenameRecomendItemsToRecommendedItems < ActiveRecord::Migration[5.2]
  def change
  	rename_table :recomend_items, :recommended_items
  end
end
