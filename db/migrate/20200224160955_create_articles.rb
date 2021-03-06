# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :image
      t.datetime :createdat
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
