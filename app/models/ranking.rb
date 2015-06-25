class Ranking < Question
  has_many :rankable_items
  has_many :votes, foreign_key: 'question_id'
  
  accepts_nested_attributes_for :rankable_items, :reject_if => :all_blank, :allow_destroy => true
  
  store_accessor :properties, :crowd_content, :pre_moderation
end
