class Users::SessionsController < Devise::SessionsController
  layout :set_layout
  before_filter :set_role, only: [:new, :create]

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
    def configure_sign_in_params
      devise_parameter_sanitizer.for(:sign_in) << [:remember_me]
    end

  # def after_sign_in_path_for(resource)
  #   if current_user.role == 'organizer'
  #     #redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization)
  #   else
  #     super(resource)
  #   end
  # end
end
