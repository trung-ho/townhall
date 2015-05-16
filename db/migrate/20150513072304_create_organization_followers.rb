class CreateOrganizationFollowers < ActiveRecord::Migration
  def change
    create_table :organization_followers do |t|
      t.references :organization, index: true
      t.references :follower, index: true
      t.boolean :receive_app_notifications
      t.boolean :receive_email
    end
  end
end
