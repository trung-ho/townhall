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
  
end
