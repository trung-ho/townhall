module Organizer
  class QuestionsController < OrganizerController
    before_action :set_question, only: [:show, :edit, :update, :destroy]
    
    def new
      @question = Question.new
    end

    def create
      organization = current_user.organizations.last
      @question = organization.questions.new(question_params)

      if @question.save
        redirect_to organizer_dashboard_index_path
      end
    end
    
    def report
      @question = Question.find(params[:id])
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"report-q#{@question.id}\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end

    private

    def question_params
      params.require(:question).permit(:title, :description, :start_date, :end_date)
    end

  end
end
