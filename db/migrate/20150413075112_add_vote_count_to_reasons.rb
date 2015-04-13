class AddVoteCountToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :votes, :integer
  end
end
