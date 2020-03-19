# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category, class_name: 'Category', optional: true
  has_many :votes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader

  def self.top_voted(num = 1)
    select('articles.id, count(votes.id) AS votes_count')
      .joins(:votes)
      .group('articles.id')
      .order('votes_count DESC')
      .limit(num)
  end

  def self.first_five()
    top1 = Article.top_voted(1)[0].nil? ? Article.first : Article.find(Article.top_voted(1)[0].id)

    cat1 = Article.find_by(category_id: 1)
    cat2 = Article.find_by(category_id: 2)
    cat3 = Article.find_by(category_id: 3)
    cat4 = Article.find_by(category_id: 4)
    cat5 = Article.find_by(category_id: 5)

    return five = [top1, cat1, cat2, cat3, cat4, cat5]
  end
end
