module UserArticle
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/users_articles'

    section :top_bar, TopBar, '.top-bar'

    element :article_title, 'ul li h3'
    element :article_body, 'ul li p'
  end
end
