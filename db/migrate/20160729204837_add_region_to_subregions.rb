class AddRegionToSubregions < ActiveRecord::Migration[5.0]
  def change
    add_reference :subregions, :region, foreign_key: true
  end
end
