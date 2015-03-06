class EnableHstoreExtension < ActiveRecord::Migration
  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    add_column :questions, :properties, :hstore
  end

  def self.down
    execute "DROP EXTENSION IF EXISTS hstore"
    drop_column :questions, :properties
  end
end
