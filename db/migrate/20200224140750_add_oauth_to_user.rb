# frozen_string_literal: true

class AddOauthToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
  end
end
