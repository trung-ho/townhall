class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.js {  }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup

    # Loads the user
    @user = User.find(params[:id])

    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)

        # Commented out skip_reconfirmation because we want TWITTER users to confirm their email address
        # If would be great to limit this to just TWITTER users where an email address is not provided / made available
        # @user.skip_reconfirmation!

        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # accessible = [ :name, :email ] # extend with your own params
      # accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(:gender, :birth_year, :location)
    end
end