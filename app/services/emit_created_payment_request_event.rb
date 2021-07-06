# frozen_string_literal: true

class EmitCreatedPaymentRequestEvent < BaseService
  def initialize(payment_request)
    self.payment_request = payment_request
  end

  def call
    WaterDrop::AsyncProducer.call(
      {
        "id" => payment_request.id,
        "description" => payment_request.description,
        "amount" => payment_request.amount,
        "currency" => payment_request.currency,
        "status" => payment_request.status
      }.to_json,
      topic: "payment_request_created")
  end

  private

  attr_accessor :payment_request
end
