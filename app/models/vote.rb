class Vote < ActiveRecord::Base
  serialize :reason_ids, Array

  belongs_to  :user
  belongs_to  :question

  scope :yes, -> { where(vote_type: YES) }
  scope :no, -> { where(vote_type: NO) }
  scope :maybe, -> { where(vote_type: MAYBE) }

  VOTE_TYPES = [YES = 'yes', NO = 'no', MAYBE = 'maybe']

  def reasons
    Reason.find(reason_ids)
  end

  def is_positive?
  	vote_type == 'yes'
  end
end
