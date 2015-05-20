class Setting::NotificationsController < Setting::ApplicationController
  before_filter :authenticate_user!, only: [:index, :follow]

  def index
    @following_organizations = current_user.following_organizations
  end

  def follow
    current_user.follow(@organization)
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end 