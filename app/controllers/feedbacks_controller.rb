class FeedbacksController < ApplicationController
  before_action :set_not_render_nav

  def new
  end

  def create
    render 'feedbacks/thank_you'
  end

  private
  def set_not_render_nav
    @not_render_nav = true
  end
end
