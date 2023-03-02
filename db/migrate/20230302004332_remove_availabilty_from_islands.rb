class RemoveAvailabiltyFromIslands < ActiveRecord::Migration[7.0]
  def change
    remove_column :islands, :availability
  end
end
