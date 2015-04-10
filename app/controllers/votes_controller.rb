class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.new(vote_params.merge(user_id: current_user.id))

    if @vote.save
      redirect_to organization_question_reasons_path(@question)
    end
  end

  def update
    vote = Vote.find(params[:id])

    if vote.update_attributes(reason_ids: params[:reason_ids])
      redirect_to organization_question_result_path(vote.question)
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:vote_type, :reason_ids)
  end
end
