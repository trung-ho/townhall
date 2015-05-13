class Question < ActiveRecord::Base
  TYPES = [VOTING = 'Voting', IDEA = 'Idea', RANKING = 'Ranking']

  mount_uploader :question_image, QuestionImageUploader

  belongs_to :organization

  scope :active, ->  { where("end_date > ?", DateTime.now).where(draft: false) }
  scope :ended, ->  { where("end_date < ?", DateTime.now).where(draft: false)  }
  scope :popular, ->  { active[0..0]  }
  scope :drafts, ->  { where(draft: true) }

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

  def engagement_percentage
    votes_count ||= votes.count.to_f
    (votes_count / (unique_visitors.to_f) * 100).round(1)
  end

  def increase_unique_visitors
    update_attributes(unique_visitors: unique_visitors + 1)
  end
end
