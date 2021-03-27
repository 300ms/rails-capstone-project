# frozen_string_literal: true

class IndexController < ApplicationController
  def index
    five = Article.first_five

    @top1 = five[0]
    @cat1 = five[1]
    @cat2 = five[2]
    @cat3 = five[3]
    @cat4 = five[4]
    @cat5 = five[5]
  end
end
