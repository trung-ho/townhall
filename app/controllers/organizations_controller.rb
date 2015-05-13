class OrganizationsController < ApplicationController
  
  def show
    @questions = @organization.questions.active
    @pop_questions = @organization.questions.popular  
    @old_questions = @organization.questions.ended 
  end

end
