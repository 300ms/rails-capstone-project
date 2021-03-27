# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Votes', type: :feature do
  scenario 'Sign up a new User and create and article, then vote the article' do
    visit '/users/sign_up'

    fill_in 'user_name', with: 'Foo Bar'
    fill_in 'user_email', with: 'abc@xyz.com'
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foobar'
    fill_in 'user_birthday', with: '12/12/2012'
    click_button 'commit'
    expect(page).to have_text('abc@xyz.com')

    visit '/articles/new'
    fill_in 'article_title', with: 'Title 1'
    fill_in 'article_text', with: 'Text 1'
    click_button 'commit'
    expect(page).to have_text('Title 1')
    expect(page).to have_text('Text 1')

    click_link 'Title 1'
    click_button 'commit'
    expect(page).to have_text('Votes: 1')
  end
end
