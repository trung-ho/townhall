module QuestionsHelper
  def days_left(day)
    day = day.to_date
    if day > Date.today
      "#{ pluralize((day - Date.today).to_i, 'Day') } left"
    else
      "Vote ended"
    end
  end
end
