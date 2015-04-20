class FeedbacksController < ApplicationController
  before_action :set_not_render_nav

  def new
  end

  def create
    feedback = Feedback.new(rating: params[:rating], comment: params[:comment])
    if feedback.save
      render 'feedbacks/thank_you'
    end
  end

  private
  def set_not_render_nav
    @not_render_nav = true
  end
end
