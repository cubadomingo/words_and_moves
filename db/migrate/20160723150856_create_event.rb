class CreateEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.string :location
      t.datetime :event_date
    end
  end
end
