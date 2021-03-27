# frozen_string_literal: true

class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :image, :string
  end
end
