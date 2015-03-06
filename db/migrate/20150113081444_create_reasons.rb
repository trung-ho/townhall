class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string  :name
      t.integer :position
      t.string  :reason_type
      
      t.belongs_to :voting
      t.timestamps
    end
  end
end
