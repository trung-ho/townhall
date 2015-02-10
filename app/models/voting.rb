class Voting < Question
  has_many :reasons_for,     -> { where reason_type: 'for'     }, class_name: 'Reason'
  has_many :reasons_against, -> { where reason_type: 'against' }, class_name: 'Reason'

  accepts_nested_attributes_for :reasons_for,     :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :reasons_against, :reject_if => :all_blank, :allow_destroy => true

  has_many :votes, foreign_key: 'question_id'
end
