class AddTimeStampToEventsAndPosts < ActiveRecord::Migration[5.0]
  def change
    change_table :events do |t|
      t.timestamps null: false
    end
    change_table :posts do |t|
      t.timestamps null: false
    end
  end
end
