class AddLeaveColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :leave_at, :string
  end
end
