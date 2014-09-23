module Comment
  class New < SitePrism::Page
    include FactoryGirl::Syntax::Methods
    include Formulaic::Dsl

    set_url '/articles'

    element :save_button, 'input[type="submit"][value="Create comment"]'

    def create_comment(options)
      fill_form(
        :comment,
        attributes_for(:comment)
            .slice(*create_comment_attributes)
            .merge(options)
      )

      save_button.click
    end

    def create_comment_attributes
      %i(body)
    end
  end
end
