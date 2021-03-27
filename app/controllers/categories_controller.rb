# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    @articles = Article.where(category_id: @category.id).includes(:author, :category, :votes)
  end
end
