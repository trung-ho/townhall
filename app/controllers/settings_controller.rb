class SettingsController < ApplicationController
  before_action :authenticate_user!

  def terms
  end

  def my_townhall
    @questions = current_user.questions
  end

  def privacy
  end

  def submission_policy
  end
end
