class Reason < ActiveRecord::Base
  REASON_TYPES = {
    yes: FOR = 'for',
    no: AGAINST = 'against',
    maybe: MAYBE = 'maybe'
  }

  validates :name, length: { maximum: 60 }

  belongs_to :voting
end
