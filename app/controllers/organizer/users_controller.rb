module Organizer
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def update
      User.transaction do
        begin
          @current_user.update_attributes(user_params)
          @current_user.main_organization.update_attributes(org_params)
        rescue ActiveRecord::RecordInvalid
          nil
        end
      end

      redirect_to organizer_dashboard_index_url(subdomain: current_user.main_organization)
    end


    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit([:first_name, :last_name, :industry])
      end

      def org_params
        params.require(:organization).permit([:name, :website, :phone, :email, :facebook, :twitter])
      end
  end
end