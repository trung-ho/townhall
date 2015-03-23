class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.create(vote_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if vote.valid?
          redirect_to organization_question_reasons_path(@question)
        end
      end

      format.js
    end
  end

  def update
    reason_id = params[:reason_id]
    vote = Vote.find(params[:id])

    if vote.update_attributes(vote_params)
      redirect_to organization_question_result_path(vote.question)
    end
  end

  def vote_params
    params.require(:vote).permit(:vote_type, :reason_ids)
  end

end
