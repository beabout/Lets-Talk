class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :likes
      t.belongs_to :topic
      t.timestamps
    end
  end
end
