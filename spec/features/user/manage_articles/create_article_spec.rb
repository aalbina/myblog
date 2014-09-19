require 'rails_helper'

feature 'Create article' do
  let(:user) { create :user, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }
  let(:create_article_page) { UserArticle::New.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I create new article' do
    create_article_page.load
    create_article_page.create_article(title: 'New article', body: '123545')

    expect(create_article_page).to have_selector('.blue', text: 'New article')
    expect(create_article_page).to have_selector('.text-16', text: '123545')
  end
end
