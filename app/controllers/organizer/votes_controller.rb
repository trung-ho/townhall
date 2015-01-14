module Organizer
  class VotesController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_vote, only: [:show, :edit, :update, :destroy]
    
    def new
      @vote = Vote.new
    end

    def create
      organization = current_user.organizations.last
      @vote = organization.votes.new(vote_params)

      if @vote.save
        redirect_to organizer_dashboard_index_path
      end
    end
    
    private

    def vote_params
      params.require(:vote).permit(:title, :description, :start_date, :end_date)
    end

  end
end
