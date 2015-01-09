module Organizer
  class OrganizationsController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_organization, only: [:show, :edit, :update, :destroy]
    
    def new
      @organization = Organization.new
    end

    def create
      @organization = current_user.organizations.new(organization_params)

      if @organization.save
        redirect_to organizer_dashboard_index_path
      end
    end
    
    private

    def organization_params
      params.require(:organization).permit(:name)
    end
  
  end

end
