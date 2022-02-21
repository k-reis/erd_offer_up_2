require "rails_helper"

RSpec.describe "buyers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/buyers/#{buyer.id}", params: params
  end

  describe "basic fetch" do
    let!(:buyer) { create(:buyer) }

    it "works" do
      expect(BuyerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("buyers")
      expect(d.id).to eq(buyer.id)
    end
  end
end
