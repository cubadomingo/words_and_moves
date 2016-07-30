class CreateUserRegionRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_region_relations do |t|
      t.references :user, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
