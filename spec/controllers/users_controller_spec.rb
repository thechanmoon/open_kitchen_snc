require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:tiburon) {{first_name: 'tiburon',
            password: '1234',
            password_confirmation: '1234'}}

  describe 'create' do
    it "creates a new user" do
      post :create, params: { user: tiburon }
      expect(User.last.first_name).to eq('tiburon')
    end

    it "login" do
      post :create, params: { user: tiburon }
      expect(session[:user_id]).to eq(User.last.id)
    end

    it "password set after the confirmatioN" do
      post :create, params: { user: tiburon }
      expect(User.last.authenticate(tiburon[:password])).to eq(User.last)
    end
  end
end
