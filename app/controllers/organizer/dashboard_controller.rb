module Organizer
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      @organization = current_user.organizations.last
    end

    def show
      @organization = current_user.organizations.find(params['id'])
    end
  end
end
