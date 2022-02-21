require "rails_helper"

RSpec.describe "sellers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sellers", params: params
  end

  describe "basic fetch" do
    let!(:seller1) { create(:seller) }
    let!(:seller2) { create(:seller) }

    it "works" do
      expect(SellerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["sellers"])
      expect(d.map(&:id)).to match_array([seller1.id, seller2.id])
    end
  end
end
