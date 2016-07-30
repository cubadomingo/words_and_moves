class AddItemToLikes < ActiveRecord::Migration[5.0]
  def change
    change_table :likes do |t|
      t.remove :event_id, :post_id
      t.references :item, polymorphic: true, index: true
    end
    change_table :dislikes do |t|
      t.remove :event_id, :post_id
      t.references :item, polymorphic: true, index: true
    end
  end
end
