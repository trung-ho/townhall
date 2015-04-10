class Reason < ActiveRecord::Base
  REASON_TYPES = {
    yes: FOR = 'for',
    no: AGAINST = 'against',
    maybe: MAYBE = 'maybe'
  }

  belongs_to :voting
end
