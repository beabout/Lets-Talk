class AddLinkToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :link, :string
  end
end
