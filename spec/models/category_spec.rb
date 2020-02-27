# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.create!(email: 'foobar6@example.com', name: 'foo bar', password: 'foobar')
    @article = Article.create(title: 'title123', text: 'text123', author_id: @user.id, category_id: '12345')
    @article2 = Article.create(title: 'title123', text: 'text123', author_id: @user.id, category_id: nil)
  end

  context 'with valid details' do
    it 'should create an article with category id' do
      expect(@article.category_id).not_to be_nil
    end
  end

  context 'with invalid details' do
    it 'should create an article without category id' do
      expect(@article2.category_id).to be_nil
    end
  end
end
