module Organizer
  class OrganizerController < ActionController::Base
    layout 'organizer'
    before_action :redirect_to_subdomain_or_create_new

    before_action :authenticate_user!
    authorize_resource :class => :OrganizerController
    before_action :set_organization

    def redirect_to_subdomain_or_create_new
    	if current_user.main_organization
        redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization) if no_subdomain?
      else
        redirect_to start_trial_path
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

