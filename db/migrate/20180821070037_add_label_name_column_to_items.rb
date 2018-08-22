class AddLabelNameColumnToItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :label_name, :string
  end
end
