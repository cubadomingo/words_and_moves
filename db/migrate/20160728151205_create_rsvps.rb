class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
