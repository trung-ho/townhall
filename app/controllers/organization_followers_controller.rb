class OrganizationFollowersController < ApplicationController
  before_action :authenticate_user!

  def toggle_receive_app_notifications
    organization_follower = OrganizationFollower.find(params[:organization_follower_id])
    return false if organization_follower.follower != current_user
    organization_follower.toggle(:receive_app_notifications).save

    @json = { status: organization_follower.receive_app_notifications?,
              notice: organization_follower.errors.full_messages.join(', ') }
              
    render :json =>  @json
  end

  def toggle_receive_email
    organization_follower = OrganizationFollower.find(params[:organization_follower_id])
    return false if organization_follower.follower != current_user
    organization_follower.toggle(:receive_email).save

    @json = { status: organization_follower.receive_email?,
              notice: organization_follower.errors.full_messages.join(', ') }
              
    render :json =>  @json
  end
end