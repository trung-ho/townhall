module Organizer
  class PagesController <  ActionController::Base
    layout 'registrations'
    before_action :authenticate_user!, only: [:member_home]

    def start_trial

    end

  end
end
