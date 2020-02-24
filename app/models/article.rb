class Article < ApplicationRecord
  belongs_to :user, class_name: "User", optional: true
  default_scope -> { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
end
