class Ranking < Question
  has_many :rankable_items
  
  accepts_nested_attributes_for :rankable_items, :reject_if => :all_blank, :allow_destroy => true
  
  store_accessor :properties, :crowd_content, :pre_moderation
end
