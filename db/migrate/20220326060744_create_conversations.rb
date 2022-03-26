class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :likes, default: 0
      t.belongs_to :topic
      t.timestamps
    end
  end
end
