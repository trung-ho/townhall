module Organizer
  class SessionsController < Devise::SessionsController
    layout 'registrations'

    def new
      super
    end

    def create
      # add custom create logic here
    end

    def update
      super
    end
  end 

end
