class Vote < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :question

  scope :yes, -> { where(vote_type: YES) }
  scope :no, -> { where(vote_type: NO) }
  scope :maybe, -> { where(vote_type: MAYBE) }

  VOTE_TYPES = [YES = 'yes', NO = 'no', MAYBE = 'maybe']

  def reasons
    ids = reason_ids.split(',')
    Reason.find(ids)
  end

  def is_positive?
  	vote_type == 'yes'
  end
end
