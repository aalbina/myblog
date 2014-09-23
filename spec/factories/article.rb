FactoryGirl.define do
  factory :article do
    user

    title 'Test article'
    body '123456'

    factory :article_with_comments do
      ignore do
        comments_count 1
      end

      after(:create) do |article, evaluator|
        create_list(:comment, evaluator.comments_count, article: article, user: article.user)
      end
    end
  end
end
