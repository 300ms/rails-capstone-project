# frozen_string_literal: true

class IndexController < ApplicationController
  def index


    @top1 = Article.find(Article.top_voted(1)[0].id)
    @cat1 = Article.find_by(category_id: 1)
    @cat2 = Article.find_by(category_id: 2)
    @cat3 = Article.find_by(category_id: 3)
    @cat4 = Article.find_by(category_id: 4)
    @cat5 = Article.find_by(category_id: 5)
  end
end
