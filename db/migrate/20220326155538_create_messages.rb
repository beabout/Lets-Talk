class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :conversation
      t.belongs_to :author
      t.boolean :left_side
      
      t.timestamps
    end
  end
end
