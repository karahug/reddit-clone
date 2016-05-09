FactoryGirl.define do
  factory :comment do
    content "MyString"
    association :subcomment, factory: :comment, strategy: :build
    post
    trait :no_subcomment do
      subcomment_id = nil
    end
  end
end
