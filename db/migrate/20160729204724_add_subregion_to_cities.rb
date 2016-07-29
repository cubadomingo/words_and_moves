class AddSubregionToCities < ActiveRecord::Migration[5.0]
  def change
    add_reference :cities, :subregion, foreign_key: true
  end
end
