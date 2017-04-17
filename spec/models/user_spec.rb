require 'rails_helper'

RSpec.describe User, type: :model do
  let(:david_mail){ "david@mail.com" }

  let(:david){
    User.create!(
      username:    "David",
      email:       david_mail,
      password:    "password",
      credentials: "hend")
  }

  let(:andy){
    User.create!(
      username:    "Andy",
      email:       "andy@mail.com",
      password:    "password",
      credentials: "hend")
  }

  before(:all) do
  end

  after(:all) do
    User.destroy_all
  end

  it "Orders by username" do
    expect( User.order(:username) ).to eq([andy, david])
  end

end
