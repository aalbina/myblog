FactoryGirl.define do
  factory :comment do
    article
    user

    title ''
    body 'Test comment'
  end
end
