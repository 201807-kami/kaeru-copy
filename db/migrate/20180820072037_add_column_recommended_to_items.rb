class AddColumnRecommendedToItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :recommended, :integer
  end
end
