module Organizer
  class VotingsController < OrganizerController
    before_action :set_voting, only: [:show, :edit, :update, :destroy]
    
    def new
      @voting = Voting.new
    end

    def create
      organization = current_user.organizations.last
      @voting = organization.votings.new(voting_params)

      if @voting.save
        redirect_to edit_organizer_voting_path(@voting)
      end
    end

    def edit
      
    end
    
    def update
      if @voting.update(voting_params)
        #binding.pry

        redirect_to organizer_dashboard_index_path, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_voting
      @voting = Voting.find(params[:id])
    end

    def voting_params
      params.require(:voting).permit(:title, :description, 
                                  :start_date, :end_date, :crowd_content, :pre_moderation,
                                  :cover_image,
                                  reasons_for_attributes: [:id, :name, :_destroy],
                                  reasons_against_attributes: [:id, :name, :_destroy] )
    end

  end
end
