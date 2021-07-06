# frozen_string_literal: true

class PaymentRequest < ApplicationRecord
  validates :amount, presence: true
  validates :currency, presence: true
  validates :description, presence: true
  validates_numericality_of :amount, greater_than: 0
end
