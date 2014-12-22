class PagesController < ApplicationController

before_action :authenticate_user!, only: [:member_home]

  def home
  end

  def member_home
  	if user_signed_in?
  		@user = current_user
  	end
  end
end
