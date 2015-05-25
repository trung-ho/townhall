module Organizer
  class OrganizerController < ActionController::Base
    layout 'organizer'
    before_action :authenticate_user!
    before_action :set_organization
    #authorize_resource :class => :OrganizerController
    
    before_action :redirect_to_subdomain

    def redirect_to_subdomain
    	if current_user.main_organization
        redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization) if no_subdomain?
      end
    end

    private

    def set_organization
      @organization = Organization.find_by_slug(request.subdomain)
    end

    def no_subdomain?
      RootSubdomain::matches?(request)
   	end
  end
end

