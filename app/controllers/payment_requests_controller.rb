# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all
  end

  def new
    @payment_request = PaymentRequest.new
  end

  def create
    payment_request = PaymentRequest.create!(payment_request_params)
    emit_created_payment_request_event(payment_request)
    redirect_to root_path, notice: "Payment request has been created"
    rescue ActiveRecord::ActiveRecordError => e
      flash[:alert] = e.message
      @payment_request = PaymentRequest.new
      render :new
  end

  private

  def payment_request_params
    params.require(:payment_request).permit(:amount, :currency, :description)
  end

  def emit_created_payment_request_event(payment_request)
    WaterDrop::SyncProducer.call(
      {
        "id" => payment_request.id,
        "description" => payment_request.description,
        "amount" => payment_request.amount,
        "currency" => payment_request.currency,
        "status" => payment_request.status
      }.to_json,
      topic: "payment_request_created")
  end
end
