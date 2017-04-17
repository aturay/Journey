require 'rails_helper'

RSpec.describe Users::SessionsController do

  it "signs user in and out" do
    user = User.create!(email: "user1@mail.com", password: "password")

    sign_in user
    expect(controller.current_user).to eq(user)

    sign_out user
    expect(controller.current_user).to be_nil
  end

end