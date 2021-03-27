# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers
  before :each do
    @user = User.create!(email: 'foobar6@example.com', name: 'foo bar', password: 'foobar')
  end

  context 'with valid details' do
    it 'should sign in as a user' do
      sign_in @user
    end
  end

  context 'with invalid details' do
    let(:email) { '' }
    let(:name) { 'User Test' }
    let(:password) { 'passwordtest' }
    it 'should fail to create a user' do
      @user = User.create(email: email, name: name, password: password)
      expect(@user).to be_invalid
    end
  end
end
