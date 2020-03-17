# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  before :each do
    @user = User.create!(email: 'foobar6@example.com', name: 'foo bar', password: 'foobar')
    @article = Article.create(title: 'title123', text: 'text123', author_id: @user.id)
  end

  context 'with valid details' do
    it 'should create vote' do
      expect(Vote.create!(user_id: @user.id, article_id: @article.id)).to be_valid
    end
  end

  context 'with invalid details' do
    it 'should fail to create a vote' do
      expect(Vote.create(user_id: nil, article_id: @article.id)).to be_invalid
    end
  end
end
