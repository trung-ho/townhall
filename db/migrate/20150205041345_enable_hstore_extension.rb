class EnableHstoreExtension < ActiveRecord::Migration
  def self.up
    enable_extension "hstore"
    add_column :questions, :properties, :hstore
  end

  def self.down
    disable_extension "hstore"
    drop_column :questions, :properties
  end
end
