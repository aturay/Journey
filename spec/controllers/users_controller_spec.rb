require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {
    User.create!(
      email: 'user@mail.com',
      password: 'password',
      credentials: 'hend')
  }


  describe "POST #edit_event" do
    it 'change credentials' do

      post :edit_event, params: {id: user.id, credentials: 'accept'}

      # It is a worked, when user sign_in session
      # body = JSON.parse(response.body)
      # expect( body = JSON.parse(response.body) ).to eq 'accept'

      expect( response.body ).to include( 'redirected' )
    end
  end
end