module Organizer
  class IdeasController < OrganizerController
    before_action :set_idea, only: [:show, :edit, :update, :destroy]
    
    def new
      @idea = Idea.new
    end

    def create
      organization = current_user.organizations.last
      @idea = organization.ideas.new(idea_params)

      if @idea.save
        redirect_to edit_organizer_idea_path(@idea)
      end
    end

    def edit
      
    end
    
    def update
      if @idea.update(idea_params)
        #binding.pry

        redirect_to organizer_dashboard_index_path, notice: 'Idea was successfully updated.'
      else
        render :edit
      end
    end

    private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description, 
                                  :start_date, :end_date, :pre_moderation,
                                  :cover_image)
    end

  end
end
