class VotesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    current_user.vote(article)
    redirect_to article_path(article)
  end

  def destroy
    article = Vote.find(params[:id]).article
    current_user.unvote(article)
    redirect_to article_path(article)
  end
end
