class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :domain
      t.string :slug
      t.timestamps
    end
  end
end
