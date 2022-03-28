class AddPositionFieldsToConversation < ActiveRecord::Migration[6.1]
  def change
    add_column :conversations, :position_a, :string
    add_column :conversations, :position_b, :string
  end
end
