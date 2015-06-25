class Reason < ActiveRecord::Base
  extend Enumerize

  REASON_TYPES = {
    yes: FOR = 'for',
    no: AGAINST = 'against',
    maybe: MAYBE = 'maybe'
  }

  validates :name, length: { maximum: 60 }

  belongs_to :voting

  enumerize :status, in: [:pending, :active], default: :pending
end
