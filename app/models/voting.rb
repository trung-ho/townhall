class Voting < Question
  has_many :reasons_for,     -> { where reason_type: 'for'     }, class_name: 'Reason'
  has_many :reasons_against, -> { where reason_type: 'against' }, class_name: 'Reason'

  accepts_nested_attributes_for :reasons_for,     :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :reasons_against, :reject_if => :all_blank, :allow_destroy => true

  has_many :votes, foreign_key: 'question_id'

  def total_votes
     votes.count
  end

  def positive_votes
    votes.where(vote_type: 'yes')
  end

  def negative_votes
    votes.where(vote_type: 'no')
  end

  def reasons_with_stats   
    positive_reasons = []
    negative_reasons = []

    positive_votes.each do |vote|
      positive_reasons << vote.reason_ids.split(',')
    end

    negative_votes.each do |vote|
      negative_reasons << vote.reason_ids.split(',')
    end

    stats = {
      positive: positive_reasons.flatten.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 },
      negative: negative_reasons.flatten.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
    }
  end

end
