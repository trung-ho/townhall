class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :birth_year, :string
  end
end
