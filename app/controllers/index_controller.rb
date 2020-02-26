# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    @articles = Article.all.to_a
    @top5 = {}
    @articles.each do |article|
      @top5[article.id]=article.votes.count
    end
    @top5 = @top5.sort_by{ |id, votes| votes}
    @top5 = @top5.last(3)
  end
end
