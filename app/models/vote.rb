class Vote < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :question

  def reasons
    ids = reason_ids.split(',')
    Reason.find(ids)
  end
end
