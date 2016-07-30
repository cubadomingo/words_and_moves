class CreateUserCityRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_city_relations do |t|
      t.references :user, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
