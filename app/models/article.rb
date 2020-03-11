# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category, class_name: 'Category', optional: true
  has_many :votes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader

  def self.top_voted(num = 10)
    select("articles.id, count(votes.id) AS votes_count")
    .joins(:votes)
    .group("articles.id")
    .order("votes_count DESC")
    .limit(num)
  end
end
