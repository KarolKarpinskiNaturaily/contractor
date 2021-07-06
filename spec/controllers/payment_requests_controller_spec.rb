# frozen_string_literal: true

require "rails_helper"

RSpec.describe PaymentRequestsController do
  describe "GET #index" do
    subject { get :index }

    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    subject { post :create, params: payment_request_params }

    let(:valid_payment_request_params) do
      { payment_request: { "amount" => 100, "currency" => "PLN", "description" => "last project" }}
    end
    let(:invalid_payment_request_params) do
      { payment_request: { "amount" => "a lot", "currency" => "PLN", "description" => "last project" }}
    end

    context "with valid params" do
      let(:payment_request_params ) { valid_payment_request_params }

      it "creates payment request" do
        expect { subject }.to change { PaymentRequest.count }.by(1)
      end

      it "calls service for emitting events" do
        expect(EmitCreatedPaymentRequestEvent).to(receive(:call).once)
        subject
      end
    end

    context "with ininvalid params" do
      let(:payment_request_params ) { invalid_payment_request_params }

      it "does not create payment request" do
        expect { subject }.to change(PaymentRequest, :count).by(0)
      end
    end
  end
end
