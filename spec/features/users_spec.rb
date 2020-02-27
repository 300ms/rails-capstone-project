# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create new User', type: :feature do
  scenario 'Sign up a new User' do
    visit root_path
    visit '/users/sign_up'

    fill_in 'user_name', with: 'Foo Bar'
    fill_in 'user_email', with: 'abc@xyz.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    fill_in 'user_birthday', with: '12/12/2012'
    click_button 'commit'
    expect(page).to have_text('abc@xyz.com')
  end
end
