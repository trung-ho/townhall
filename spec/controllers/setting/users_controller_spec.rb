require 'rails_helper'

describe Setting::UsersController, :type => :controller do
  describe '#show' do 
    def do_request
      get :show
    end

    let!(:user) { create(:user) }

    before { sign_in user }

    it 'renders view :show' do 
      do_request
      expect(response).to render_template :show
    end
  end

  describe '#edit' do 
    def do_request
      get :edit
    end

    let!(:user) { create(:user) }

    before { sign_in user }

    it 'renders view :edit' do 
      do_request 
      expect(response).to render_template :edit
    end
  end

  describe '#update' do 
    def do_request
      patch :update, params
    end

    let!(:new_first_name)    { 'New first name' }
    let!(:user)              { create(:user) }
    let!(:params)            { { user: update_params } }
    let!(:user)              { create(:user) }
    
    before    { sign_in user }

    context "Success" do
      let!(:update_params)     { { first_name: new_first_name } }

      it "allows user to update info" do 
        do_request
        expect(user.reload.first_name).to eq new_first_name
        expect(flash[:notice]).to eq 'User was successfully updated.'
        expect(response).to redirect_to setting_user_url
      end
    end

    context "Fail" do 
      let!(:update_params)     { { email: '' } }
      
      it "render view :edit" do
        do_request
        expect(response).to render_template :edit
      end
    end
  end
end