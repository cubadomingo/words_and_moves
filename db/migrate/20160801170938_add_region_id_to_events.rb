class AddRegionIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :region, foreign_key: true
  end
end
