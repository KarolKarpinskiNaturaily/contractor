# frozen_string_literal: true

class UpdatedPaymentRequestConsumer < ApplicationConsumer
  def consume
    payment_request= ::PaymentRequest.find(parsed_params["id"])
    payment_request.update!(status: parsed_params["status"])
  end

  private

  def parsed_params
    params.payload
  end
end
