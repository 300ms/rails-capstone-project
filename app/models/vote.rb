# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :article, class_name: 'Article', optional: true
end
