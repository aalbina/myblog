FactoryGirl.define do
  factory :user do
    email

    full_name 'John Smith'
    password '123456'
    password_confirmation '123456'

    factory :user_with_articles do
      ignore do
        articles_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:article, evaluator.articles_count, user: user)
      end
    end

    factory :user_with_articles_and_comments do
      ignore do
        articles_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:article_with_comments, evaluator.articles_count, user: user)
      end
    end
  end

  trait :confirmed do
    confirmed_at 1.hour.ago
  end

  trait :not_confirmed do
    confirmed_at nil

    after(:create) do |user|
      user.update_attributes(confirmation_sent_at: 3.days.ago)
    end
  end
end
