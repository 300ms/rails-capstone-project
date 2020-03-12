require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before :each do
    @user = User.create!(email: 'foobar6@example.com', name: 'foo bar', password: 'foobar')
  end

  context 'with valid details' do
    let(:title) { 'Title Test' }
    let(:text) { 'Text Test' }
    it 'should create an article' do
      @article = Article.create!(title: title, text: text, author_id: @user.id)
    end
  end

  context 'without a user id' do
    let(:title) { 'Title Test' }
    let(:text) { 'Text Test' }
    it 'should fail to create an article' do
      @article = Article.create(title: title, text: text)
      expect(@article).to be_invalid
    end
  end
end
