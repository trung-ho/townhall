module Organizer
  class DashboardController < OrganizerController
    
    def index
      @organization = current_user.organizations.any? ? current_user.organizations.last : nil
      if @organization.nil?
        redirect_to new_organizer_organization_path
      else
        @questions = @organization.questions 
      end
    end

    def show
      @organization = current_user.organizations.find(params['id'])
    end
  end
end
