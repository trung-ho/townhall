class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def show
    @questions = @organization.questions  
    @pop_questions = @organization.questions.all[0..0]  
    @old_questions = @organization.questions.where("end_date < ?", DateTime.now)  
  end

  private

  def set_organization
    @organization = Organization.friendly.find(request.subdomain)
  end
end
