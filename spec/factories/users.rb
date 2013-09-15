# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Christoph Görn"
    email "goern@b4mad.net"
    provider "facebook"
    uid "1066967336"
  end
end
