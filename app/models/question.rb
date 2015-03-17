class Question < ActiveRecord::Base
   mount_uploader :cover_image, CoverImageUploader

   belongs_to :organization
end
