class AddCoverImageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :cover_image, :string
  end
end
