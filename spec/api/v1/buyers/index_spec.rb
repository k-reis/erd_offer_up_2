require "rails_helper"

RSpec.describe "buyers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/buyers", params: params
  end

  describe "basic fetch" do
    let!(:buyer1) { create(:buyer) }
    let!(:buyer2) { create(:buyer) }

    it "works" do
      expect(BuyerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["buyers"])
      expect(d.map(&:id)).to match_array([buyer1.id, buyer2.id])
    end
  end
end
