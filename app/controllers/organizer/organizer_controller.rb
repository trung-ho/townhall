module Organizer
  class OrganizerController < ApplicationController
    layout 'organizer'
    before_action :authenticate_user!  
  end
end

