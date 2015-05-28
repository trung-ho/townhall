module Organizer
  class OrganizationsController < ApplicationController
    layout 'organizer'
    before_action :authenticate_user!

    before_action :set_organization, only: [:show, :edit, :update, :destroy]

    def new
      @organization = Organization.new
      render layout:  'registrations'  
    end

    def create
      @organization = current_user.organizations.new(organization_params)
      set_user_as_admin

      if @organization.save
        redirect_to details_path
        #redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization)
      else 
        render :new, layout:  'registrations'  
      end
    end

    def update
      if @organization.update(organization_params)
        redirect_to organizer_dashboard_index_path, notice: 'Organization was successfully updated.'
      else
        render :edit
      end
    end

    
    private

    def organization_params
      params.require(:organization).permit(:name, :description, :banner, :phone, :email, :website, :twitter, :facebook, :slug)
    end

    def set_organization
      @organization = current_user.organizations.friendly.find(params[:id])
    end
  
    def set_user_as_admin
      current_user.update_attributes(role: 'organizer')  
    end
  end

end
