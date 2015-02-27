class CreateRankableItems < ActiveRecord::Migration
  def change
    create_table :rankable_items do |t|
      t.string :name
      t.integer :position

      t.belongs_to :ranking

      t.timestamps
    end
  end
end
