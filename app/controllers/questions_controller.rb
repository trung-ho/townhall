class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def show 
    @reasons_for =     @question.reasons_for.all
    @reasons_against = @question.reasons_against.all
  end
  
  private

  def set_question
    @question = Question.find(params[:id])
  end
end
