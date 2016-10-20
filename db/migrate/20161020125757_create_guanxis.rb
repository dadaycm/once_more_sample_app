class CreateGuanxis < ActiveRecord::Migration[5.0]
  def change
    create_table :guanxis do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :guanxis, :followed_id
    add_index :guanxis, :follower_id
    add_index :guanxis, [:follower_id, :followed_id], unique:true

  end
end
