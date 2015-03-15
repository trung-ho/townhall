class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def show
    @questions = @organization.questions  
  end

  private

  def set_organization
    @organization = Organization.friendly.find(request.subdomain)
  end
end
