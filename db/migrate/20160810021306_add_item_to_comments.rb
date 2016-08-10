class AddItemToComments < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.remove :event_id, :post_id
      t.references :item, polymorphic: true, index: true
    end
  end
end
