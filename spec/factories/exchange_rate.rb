# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    from { FFaker::Currency.code }
    to   { FFaker::Currency.code }
  end
end
