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

    @cat_1 = Article.find_by(category_id: 1)
    @cat_2 = Article.find_by(category_id: 2)
    @cat_3 = Article.find_by(category_id: 3)
    @cat_4 = Article.find_by(category_id: 4)
    @cat_5 = Article.find_by(category_id: 5)
  end
end
