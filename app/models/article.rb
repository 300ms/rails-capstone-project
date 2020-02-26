class Article < ApplicationRecord
  belongs_to :user, class_name: "User", optional: true
  belongs_to :category, class_name: "Category", optional: true
  has_many :votes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
  mount_uploader :image, ImageUploader

  def get_votes
    return votes.count
  end
end
