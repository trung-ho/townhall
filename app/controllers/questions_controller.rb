class QuestionsController < ApplicationController
   before_action :set_question, only: [:show, :reasons, :result, :edit, :update, :destroy]
   before_filter :authenticate_user!, only: [:reasons, :result, :edit, :update, :destroy]

  def show 

  end

  def reasons
    @vote = @question.votes.where(user_id: current_user.id).first

    @reasons_for =     @question.reasons_for.all
    @reasons_against = @question.reasons_against.all

    @total_votes =       @question.total_votes
    @positive_votes =    @question.positive_votes.count
    @negative_votes =    @question.negative_votes.count
    
    # @percentage_positive =  ((@positive_votes.to_f / @total_votes)*100).floor
    # @percentage_negative =  100 - @percentage_positive

    @organization = @question.organization
  end

  def result
    @reasons_for =     @question.reasons_for.all
    @reasons_against = @question.reasons_against.all

    @total_votes =       @question.total_votes
    @positive_votes =    @question.positive_votes.count
    @negative_votes =    @question.negative_votes.count   

    @reasons_stats  =    @question.reasons_with_stats 
  end

  private

  def set_question
    @question = Question.find(params[:id] || params[:question_id])
  end
end
