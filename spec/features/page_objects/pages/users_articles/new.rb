module UserArticle
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/users_articles/new'

    element :save_button, 'input[type="submit"][value="Save"]'

    def create_article(options)
      fill_form(
        :article,
        attributes_for(:article)
            .slice(*create_article_attributes)
            .merge(options)
      )

      save_button.click
    end

    def create_article_attributes
      %i(title body)
    end
  end
end
