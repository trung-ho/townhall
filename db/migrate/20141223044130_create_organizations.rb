class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string  :name
      t.string  :email
      t.string  :status
      t.boolean :show_recommendations
      t.boolean :show_subscriptions
      t.string  :subscription_label
      t.string  :subscription_issue_label
      t.integer :report_number
      t.string  :page_alias
      t.string  :facebook_page_url
      t.string  :facebook_page_id
      t.string  :facebook_page_access_token
      t.string  :user_id
      t.text    :twitter_feed
      t.string  :contact_email
      t.string  :contact_website
      t.string  :contact_telephone

      t.timestamps
    end
  end
end
