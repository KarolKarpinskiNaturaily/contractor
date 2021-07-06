# frozen_string_literal: true

FactoryBot.define do
  factory :payment_request do
    description { "Test" }
    amount { 100 }
    currency { "pln" }
    status { "pending" }
  end
end
