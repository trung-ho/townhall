class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true
      t.references :organization, index: true
      t.boolean :receive_app_notifications
      t.boolean :receive_email
    end
  end
end
