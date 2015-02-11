class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string  :vote_type
      t.string  :reason_ids

      t.belongs_to :question
      t.belongs_to :user
      t.timestamps
    end
  end
end
