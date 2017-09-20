class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.references :friendable, polymorphic: true
      t.integer :friend_id
      t.integer :status
      t.integer :blocker_id, default: nil

      t.timestamps
    end
  end
end
