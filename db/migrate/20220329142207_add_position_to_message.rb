class AddPositionToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :position, :integer
    remove_column :messages, :left_side
  end
end
