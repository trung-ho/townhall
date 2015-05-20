module Organizer
  class DashboardController < OrganizerController
    
    def index
      @organization = current_user.organizations.any? ? current_user.organizations.last : nil
      if @organization.nil?
        redirect_to new_organizer_organization_path
      else
        @active_questions = @organization.questions.active
        @draft_questions = @organization.questions.drafts 
        @ended_questions = @organization.questions.ended
      end
    end

    def show
      @organization = current_user.organizations.find(params['id'])
    end
  end
end
