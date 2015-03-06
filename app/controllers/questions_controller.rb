class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :result, :edit, :update, :destroy]
   before_filter :authenticate_user!

  def show 
    @reasons_for =     @question.reasons_for.all
    @reasons_against = @question.reasons_against.all
  end

  def result
    @total_votes = @question.total_votes
    @positive_votes =    @question.positive_votes.count
    @negative_votes =    @question.negative_votes.count
  
    @reasons_stats  =    @question.reasons_with_stats
    
    @percentage_positive =  ((@positive_votes.to_f / @total_votes)*100).floor
    @percentage_negative =  100 - @percentage_positive

    # binding.pry
  end

  private

  def set_question
    @question = Question.find(params[:id] || params[:question_id])
  end
end
