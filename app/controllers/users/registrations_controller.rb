class Users::RegistrationsController < Devise::RegistrationsController
  layout :set_layout
  before_filter :set_role
  before_filter :configure_sign_up_params, only: [:create]
  #before_filter :configure_account_update_params, only: [:update]

  def new
    super
  end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << [:role, :terms]
  end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    if current_user.role == 'organizer'
      new_organizer_organization_path
    else
      super(resource)
    end
  end

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
end
