require "rails_helper"

RSpec.describe "buyers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/buyers/#{buyer.id}"
  end

  describe "basic destroy" do
    let!(:buyer) { create(:buyer) }

    it "updates the resource" do
      expect(BuyerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Buyer.count }.by(-1)
      expect { buyer.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
