class RemoveRegionRefFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :region_id
  end
end
