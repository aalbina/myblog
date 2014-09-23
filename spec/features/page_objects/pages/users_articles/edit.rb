module UserArticle
  class Edit < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/users_articles'

    section :top_bar, TopBar, '.top-bar'

    element :article_title, 'h2'
    element :article_body, 'p.text-16'
    element :edit_link, 'a.btn_xs', text: 'Edit'
    element :update_button, 'input[type="submit"][value="Save"]'
    element :validation_error_alert, '.red'
    element :delete_link, 'a.btn_xs', text: 'Delete'

    def edit_article(options)
      fill_form(
        :article,
        attributes_for(:article)
            .slice(*edit_article_attributes)
            .merge(options)
      )

      update_button.click
    end

    def edit_article_attributes
      %i(title body)
    end

    def delete_article
      delete_link.click
    end
  end
end
