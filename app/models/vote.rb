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

  def reason_ids= reason_ids
    if reason_ids.is_a?(String)
      super(reason_ids.split(',').map { |s| s.to_i } )
    end
  end

  def is_positive?
  	vote_type == 'yes'
  end

  def update_cached_rankings
    reason_ids.each_with_index do |rankable_id, order|
      points = [3,2,1][order] 
      item = RankableItem.find(rankable_id)
      item.update_attributes(points: item.points + points)
    end
  end

end
