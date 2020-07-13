require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    User.destroy_all
  end

  let(:connie) {User.create(first_name: 'Tiburon', password: '1234')}

  describe 'post create' do
    it 'login with the correct password' do
      post :create, params: { user: {first_name: connie.first_name, password: connie.password} }
      expect(session[:user_id]).to eq(connie.id)
    end

    it 'login fail with wrong passwords' do
      post :create, params: { user: {first_name: connie.first_name, password: connie.password + '1111'} }
      expect(session[:user_id]).to be_nil
    end

    it 'rejects empty passwords' do
      post :create, params: { user: {first_name: connie.first_name, password: ''} }
      expect(session[:user_id]).to be_nil
    end
  end
end
