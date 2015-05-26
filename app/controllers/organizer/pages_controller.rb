module Organizer
  class PagesController <  ActionController::Base
    layout 'registrations'
    before_action :authenticate_user!, only: [:member_home]

    def start_trial

    end

    def details
        @organization = current_user.main_organization
    end

  end
end
