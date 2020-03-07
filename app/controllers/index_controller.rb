# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @articles = Article.all.to_a
    @top1 = {}
    @articles.each do |article|
      @top1[article.id] = article.votes.count
    end
    @top1 = @top1.sort_by { |_id, votes| votes }
    @top1 = @top1.last(1)

    @cat1 = Article.find_by(category_id: 1)
    @cat2 = Article.find_by(category_id: 2)
    @cat3 = Article.find_by(category_id: 3)
    @cat4 = Article.find_by(category_id: 4)
    @cat5 = Article.find_by(category_id: 5)
  end
end
