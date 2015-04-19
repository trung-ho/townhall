class AddAttributesToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :phone, :string
    add_column :organizations, :website, :string
    add_column :organizations, :string, :string
    add_column :organizations, :twitter, :string
    add_column :organizations, :facebook, :string
  end
end
