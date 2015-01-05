module Organizer
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      render html: "dashboard"
    end

    def show
      @organization = current_user.organizations.find(params['id'])
    end
  end
end
