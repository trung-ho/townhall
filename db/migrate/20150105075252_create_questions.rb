class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :title
      t.string      :description
      t.datetime    :start_date
      t.datetime    :end_date
      t.boolean     :published
      
      t.string      :type
      t.belongs_to  :organization

      t.timestamps
    end
  end
end
