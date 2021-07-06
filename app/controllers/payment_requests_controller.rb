# frozen_string_literal: true

class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all
  end

  def new
    @payment_request = PaymentRequest.new
  end

  def create
    @payment_request = PaymentRequest.create!(payment_request_params)
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

end
