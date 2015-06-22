class Voting < Question
  has_many :reasons_for,     -> { where reason_type: Reason::FOR     }, class_name: 'Reason'
  has_many :reasons_against, -> { where reason_type: Reason::AGAINST }, class_name: 'Reason'
  has_many :reasons_maybe, -> { where reason_type: Reason::MAYBE }, class_name: 'Reason'

  accepts_nested_attributes_for :reasons_for,     :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :reasons_against, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :reasons_maybe, :reject_if => :all_blank, :allow_destroy => true

  has_many :votes, foreign_key: 'question_id'
  has_many :users, through: :votes
  store_accessor :properties, :crowd_content, :pre_moderation

  def vote_percentages
    total = votes.count.to_f
    yes_count = votes.yes.count
    no_count = votes.no.count
    maybe_count = votes.maybe.count
    base_width = [yes_count, no_count, maybe_count].max.to_f
    {
      yes: { percent: ((yes_count/total).round(2) * 100).to_i, width: ((yes_count/base_width).round(2) * 100).to_i },
      no: { percent: ((no_count/total).round(2) * 100).to_i, width: ((no_count/base_width).round(2) * 100).to_i },
      maybe: { percent: ((maybe_count/total).round(2) * 100).to_i, width: ((maybe_count/base_width).round(2) * 100).to_i }
    }
  end
  
  def positive_votes
    votes.where(vote_type: Vote::YES)
  end

  def negative_votes
    votes.where(vote_type: Vote::NO)
  end

  def maybe_votes
    votes.where(vote_type: Vote::MAYBE)
  end


  def reasons_with_stats
    positive_reasons = []
    maybe_reasons = []
    negative_reasons = []

    positive_votes.each do |vote|
      positive_reasons << vote.reason_ids.split(',')  if vote.reason_ids
    end

    maybe_votes.each do |vote|
      maybe_reasons << vote.reason_ids.split(',')  if vote.reason_ids
    end

    negative_votes.each do |vote|
      negative_reasons << vote.reason_ids.split(',') if vote.reason_ids
    end

    positive_users ||= users.where('vote_type = ?', Vote::YES)
    negative_users ||= users.where('vote_type = ?', Vote::NO)
    maybe_users ||= users.where('vote_type = ?', Vote::MAYBE)
    
    stats = {
      yes: {
        age: {
          a: positive_users.where('birth_year < ?',  25.years.ago).count,
          b: positive_users.where('birth_year > ? and birth_year < ?',  25.years.ago, 34.years.ago).count,
          c: positive_users.where('birth_year > ? and birth_year < ?',  35.years.ago, 44.years.ago).count,
          d: positive_users.where('birth_year > ? and birth_year < ?',  45.years.ago, 54.years.ago).count,
          e: positive_users.where('birth_year > ?',  55.years.ago).count
        }, 
        reasons: positive_reasons.flatten.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 },
      },

      no: {
        age: {
          a: negative_users.where('birth_year < ?',  25.years.ago).count,
          b: negative_users.where('birth_year > ? and birth_year < ?',  25.years.ago, 34.years.ago).count,
          c: negative_users.where('birth_year > ? and birth_year < ?',  35.years.ago, 44.years.ago).count,
          d: negative_users.where('birth_year > ? and birth_year < ?',  45.years.ago, 54.years.ago).count,
          e: negative_users.where('birth_year > ?',  55.years.ago).count
        },
        reasons: negative_reasons.flatten.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 },
      },

      maybe: {
        age: {
          a: maybe_users.where('birth_year < ?',  25.years.ago).count,
          b: maybe_users.where('birth_year > ? and birth_year < ?',  25.years.ago, 34.years.ago).count,
          c: maybe_users.where('birth_year > ? and birth_year < ?',  35.years.ago, 44.years.ago).count,
          d: maybe_users.where('birth_year > ? and birth_year < ?',  45.years.ago, 54.years.ago).count,
          e: maybe_users.where('birth_year > ?',  55.years.ago).count
        },
        reasons: maybe_reasons.flatten.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 } 
      } 
    }
  end

end
