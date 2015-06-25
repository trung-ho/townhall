class AddPointsToRankableItems < ActiveRecord::Migration
  def change
     add_column :rankable_items, :points, :integer, :default => 0
  end
end
