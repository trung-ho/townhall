class QuestionsController < ApplicationController
   before_action :set_question, only: [:show, :reasons, :result, :edit, :update, :destroy]
   before_filter :authenticate_user!, only: [:reasons, :result, :edit, :update, :destroy]
   before_filter :store_location
   before_filter :set_as_visited

  def show
  end

  def reasons
    @vote = @question.votes.where(user_id: current_user.id).order(created_at: :desc).first
    @vote_type = @vote.vote_type
    @reasons = case @vote_type
    when Vote::YES
      @question.reasons_for
    when Vote::NO
      @question.reasons_against
    when Vote::MAYBE
      @question.reasons_maybe
    end

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

  def store_location
    session["user_return_to"] = request.original_url
  end

  def set_as_visited
    @question.increase_unique_visitors  unless session["visited-#{@question.id}"]
    session["visited-#{@question.id}"] = true
  end
end
