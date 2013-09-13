# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lob do
    description "MyText"
    author_fb_id 1
    user_fb_id 1
  end
end
