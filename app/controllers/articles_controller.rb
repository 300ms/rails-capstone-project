# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def show
    @article = find_article
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    @article.category_id = params[:category_id]
    if @article.save
      flash[:success] = "You've posted successfully!"
      redirect_to article_path(@article)
    else
      flash[:error] = 'Creation has failed!'
      render 'new'
    end
  end

  def index
    @articles = Article.all.order(created_at: :desc).includes(:author, :category, :votes)
    @logged_in = user_signed_in?
  end

  def destroy
    @article = find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
