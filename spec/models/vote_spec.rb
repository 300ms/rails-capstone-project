# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do
  before :each do
    text = 'The Teams page contains a listing of the various Community Teams,
            their responsibilities, links to their Wiki Home Pages and leaders,
            communication tools, and a quick reference to let you know whether
            Most Teams’ Wiki Home Pages provide information about who they are,
            what they do, when their meetings are, and how to contact them.
            Using these pages, teammates are able to communicate and
            LooTeamsFor participating on the Country area team contributing to
            a Local Development of Localization and Internationalization and
            Like most communities, we have our rules and governing body.
            Anyone can join and participate in most, if not all, of our Teams
            and Projects. But if you want an “@ubuntu.com” e-mail address, it
            has to be earned. Find out how in our Membership section.
            As an active member of our community, you probably should check out
            what else is going on in the world of Ubuntu:
            The Fridge articles all the latest News and Upcoming Events.
            Planet Ubuntu is a collection of community blogs.
            If you are interested in getting to know other Ubuntu users or
            seeing a list of Ubuntu teams outside the general Ubuntu world,
            check out our social network. '

    @user = User.create!(email: 'foobar6@example.com', name: 'foo bar', password: 'foobar')
    @article = Article.create(title: 'title123', text: 'text123', author_id: @user.id)
    @article2 = Article.create(title: 'title123', text: text, author_id: @user.id)
    @vote = Vote.create(user_id: @user.id, article_id: @article.id)
  end

  context 'with valid details' do
    it 'should create a vote' do
      expect(@article.votes.count).to eq(1)
    end
  end

  context 'with valid details' do
    it 'should submit a users vote on article' do
      expect(@article.votes.count).to eq(1)
    end
  end
end
