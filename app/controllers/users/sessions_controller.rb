class Users::SessionsController < Devise::SessionsController
  layout :set_layout
  before_filter :set_role

  def set_layout
    'registrations' if RootSubdomain.matches?(request)
  end

  def set_role
    if RootSubdomain.matches?(request)
      @role = 'organizer' 
    else 
      @role = 'voter'
    end
  end
  
  private 
    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_in) << [:remember_me]
    end
end
