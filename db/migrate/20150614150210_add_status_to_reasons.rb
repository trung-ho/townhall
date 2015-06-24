class AddStatusToReasons < ActiveRecord::Migration
  def change
    add_column :reasons, :status, :string
  end
end
