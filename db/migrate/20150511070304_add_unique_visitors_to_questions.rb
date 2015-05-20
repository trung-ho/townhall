class AddUniqueVisitorsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :unique_visitors, :integer, :default => 0
  end
end
