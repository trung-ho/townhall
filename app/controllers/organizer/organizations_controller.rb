module Organizer
  class OrganizationsController < OrganizerController
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

    def update
      if @organization.update(organization_params)
        redirect_to organizer_dashboard_index_path, notice: 'Organization was successfully updated.'
      else
        render :edit
      end
    end

    
    private

    def organization_params
      params.require(:organization).permit(:name, :banner, :phone, :email, :website, :twitter, :facebook)
    end

    def set_organization
      @organization = current_user.organizations.friendly.find(params[:id])
    end
  
  end

end
