module Organizer
  class OrganizerController < ActionController::Base
    layout 'organizer'
    before_action :authenticate_user!
    authorize_resource :class => :OrganizerController
    before_action :redirect_to_subdomain

    def redirect_to_subdomain
    	if current_user.main_organization
        redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization) if no_subdomain?
      end
    end

    private

    def no_subdomain?
      RootSubdomain::matches?(request)
   	end
  end
end

