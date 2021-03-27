# frozen_string_literal: true

module ArticlesHelper
  def article_user_name(article)
    article.author.name if @logged_in
  end

  def create_article_link
    link_to 'Create Article', new_article_path if user_signed_in?
  end
end
