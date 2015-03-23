class Vote < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :question

  VOTE_TYPES = [YES = 'yes', NO = 'no', MAYBE = 'maybe']

  def reasons
    ids = reason_ids.split(',')
    Reason.find(ids)
  end

  def is_positive?
  	vote_type == 'yes'
  end
end
