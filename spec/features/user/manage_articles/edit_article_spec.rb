require 'rails_helper'

feature 'Manage article' do
  let(:user) { create :user_with_posts, :confirmed }
  let(:article) { create :article }

  let(:login_page) { Devise::Sessions::New.new }
  let(:edit_article_page) { UserArticle::Edit.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I edit article' do
    edit_article_page.load
    edit_article_page.edit_link.click

    edit_article_page.edit_article(title: 'Edit article', body: '148675')

    expect(edit_article_page.article_title).to have_text('Edit article')
    expect(edit_article_page.article_body).to have_text('148675')
  end

  scenario 'I tab wrong article name' do
    edit_article_page.load
    edit_article_page.edit_link.click

    edit_article_page.edit_article(title: '', body: '148675')

    expect(edit_article_page).to have_validation_error_alert
  end

  scenario 'I tab wrong article body' do
    edit_article_page.load
    edit_article_page.edit_link.click

    edit_article_page.edit_article(title: 'Editing article', body: '')

    expect(edit_article_page).to have_validation_error_alert
  end

  scenario 'I delete article' do
    edit_article_page.load
    edit_article_page.delete_article

    expect(edit_article_page.article_body).to have_text('You have no articles now :(')
  end
end
