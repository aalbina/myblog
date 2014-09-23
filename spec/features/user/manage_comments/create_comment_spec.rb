require 'rails_helper'

feature 'Create comment' do
  let(:user) { create :user_with_articles_and_comments, :confirmed }

  let(:login_page) { Devise::Sessions::New.new }

  before(:each) do
    login_page.load
    login_page.sign_in(user.email, '123456')
  end

  scenario 'I create new comment' do
    expect(user.comment).to have_text('Test comment')
  end
end
