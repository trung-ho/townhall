class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string  :vote_type

      t.belongs_to :question
      t.belongs_to :user
      t.belongs_to :reason
      t.timestamps
    end
  end
end
