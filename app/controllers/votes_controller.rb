class VotesController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def create
    @question = Question.find(params[:question_id])
    vote = @question.votes.build(vote_params)
    vote.user_id = current_user.id 
    
    #reason_ids = params.select {|k,v| v == 'on' }.map {|k,v| k}[1..-1]
    #binding.pry

    if vote.save
      
    end
  end

  def reason
    reason_id = params[:reason_id]
    @question = Question.find(params[:question_id])
    if @question
      vote = @question.votes.where(user_id: current_user.id).first
      vote.update_attributes(reason_id: reason_id)
    end
  end

  def vote_params
    params.require(:vote).permit(:vote_type, :reason_ids)
  end

end
