module Organizer
  class RankingsController < OrganizerController
    before_action :set_ranking, only: [:show, :edit, :update, :destroy]
    
    def new
      @ranking = Ranking.new
    end

    def create
      if params[:ranking][:draft] == 'preview'
        @preview = true 
        params[:ranking][:draft] = true
      end

      organization = current_user.organizations.last
      @ranking = organization.rankings.new(ranking_params)

      if @ranking.save
        redirect_to organization_question_url(@ranking)
      else
        render :new
      end
    end

    def edit
      
    end
    
    def update
      draft = @ranking.draft?

      if @ranking.update(ranking_params)
        #binding.pry
        if draft
          redirect_to organization_question_url(@ranking)
        else
          redirect_to edit_organizer_ranking_path(@ranking), notice: 'Question was successfully updated.'
        end
      else
        render :edit
      end
    end

    private

    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    def ranking_params
      params.require(:ranking).permit(:title, :description, 
                                  :start_date, :end_date, :crowd_content, :pre_moderation, :draft,
                                  :cover_image,
                                  :question_image,
                                  rankable_items_attributes: [:id, :name, :_destroy] )
    end

  end
end
