class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show 
    @reasons_for =     @question.reasons_for.all
    @reasons_against = @question.reasons_against.all
  end

  def vote
    vote_type = (params[:vote] == 'yes') ? 'for' : 'against'
    @question = Question.find(params[:question_id])
    vote = Vote.create(user_id: current_user.id, vote_type: vote_type, question_id: @question.id)
  end

  def reason
    reason_id = params[:reason_id]
    @question = Question.find(params[:question_id])
    if @question
      vote = @question.votes.where(user_id: current_user.id).first
      vote.update_attributes(reason_id: reason_id)
    end
  end
  
  private

  def set_question
    @question = Question.find(params[:id])
  end
end
