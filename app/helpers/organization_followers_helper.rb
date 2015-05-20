module OrganizationFollowersHelper
  def receive_app_notifications_button(organization_follower)
    id = 'receive_app_notifications' + organization_follower.id.to_s
    button_class = organization_follower.receive_app_notifications? ? 'button-yes' : 'button-no'
    link_to('', toggle_notifications_follower_path(organization_follower), remote: true, id: id, class: "toggle-button #{button_class}")
  end

  def receive_receive_email_button(organization_follower)
    id = 'receive_email' + organization_follower.id.to_s
    button_class = organization_follower.receive_email? ? 'button-yes' : 'button-no'
    link_to('', toggle_email_follower_path(organization_follower), remote: true, id: id, class: "toggle-button #{button_class}")
  end
end
