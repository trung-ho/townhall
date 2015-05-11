class Setting::UsersController < Setting::ApplicationController
  before_filter :authenticate_user!, only: [:show, :edit, :update]

  def show; end
  
  def edit; end

  def update
    params[:user].delete :password if params[:user][:password].blank?

    if current_user.update(update_params)
      redirect_to setting_user_url, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :birth_year,
            :location,
            :gender
      )
  end
end 