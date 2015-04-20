class OrganizationsController < ApplicationController
  
  def show
    @questions = @organization.questions.where("end_date > ?", DateTime.now)
    @pop_questions = @organization.questions.all[0..0]  
    @old_questions = @organization.questions.where("end_date < ?", DateTime.now)  
  end

end
