class AddUserContributedToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :user_contributed, :boolean
  end
end
