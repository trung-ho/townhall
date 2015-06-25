module Organizer
  class VotingsController < OrganizerController
    before_action :set_voting, only: [:show, :edit, :update, :destroy]
    
    def new
      @voting = Voting.new
      @voting.reasons_for.new
      @voting.reasons_against.new
      @voting.reasons_maybe.new
    end

    def create
      if params[:voting][:draft] == 'preview'
        @preview = true 
        params[:voting][:draft] = true
      end
      
      organization = current_user.organizations.last
      @voting = organization.votings.new(voting_params)

      if @voting.save
        redirect_to organization_question_url(@voting)
      else
        render :new
      end

    end

    def edit
      
    end
    
    def update
      if @voting.update(voting_params)
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
                                  :start_date, :end_date, :crowd_content, :pre_moderation, :draft, 
                                  :question_image,
                                  reasons_for_attributes: [:id, :name, :status, :_destroy],
                                  reasons_maybe_attributes: [:id, :name, :status, :_destroy],
                                  reasons_against_attributes: [:id, :name, :status, :_destroy] )
    end

  end
end
