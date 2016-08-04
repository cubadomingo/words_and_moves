class DropUserCityRelationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_city_relations
  end
end
