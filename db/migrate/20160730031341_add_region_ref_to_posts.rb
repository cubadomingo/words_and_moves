class AddRegionRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :region, foreign_key: true
  end
end
