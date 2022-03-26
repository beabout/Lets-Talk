class CreateConversationsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_participants do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :participating_user, default: true
      t.boolean :left_side # conversations happen with two sides. Is this user on the left side (not political left)
    end
  end
end
