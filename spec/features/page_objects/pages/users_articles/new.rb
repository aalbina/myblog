module UserArticle
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/users_articles/new'

    section :top_bar, TopBar, '.top-bar'

    element :save_button, 'input[type="submit"]', text: 'Сохранить'

    def create_article(title, body)
      fill_form(
        title: title,
        body: body
      )

      save_button.click
    end
  end
end
