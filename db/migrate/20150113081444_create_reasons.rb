class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.string :name
      t.integer :position

      t.belongs_to :vote
      t.timestamps
    end
  end
end
