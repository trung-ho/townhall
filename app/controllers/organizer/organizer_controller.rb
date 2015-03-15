module Organizer
  class OrganizerController < ApplicationController
    layout 'organizer'
    before_action :authenticate_user!  
    before_action :redirect_to_subdomain

    def redirect_to_subdomain
    	redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization) if no_subdomain?
    end

    private

    def no_subdomain?
      RootSubdomain::matches?(request)
   	end
  end
end

