class DeleteRecomendItems < ActiveRecord::Migration[5.2]
  def change
  	drop_table :recomend_items
  end
end
