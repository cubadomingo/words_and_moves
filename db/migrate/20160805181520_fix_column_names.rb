class FixColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :location, :venue
    remove_column :events, :event_date, :datetime
    add_column :events, :date, :date
    add_column :events, :time, :time
  end
end
