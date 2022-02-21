require "rails_helper"

RSpec.describe "buyers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/buyers/#{buyer.id}", payload
  end

  describe "basic update" do
    let!(:buyer) { create(:buyer) }

    let(:payload) do
      {
        data: {
          id: buyer.id.to_s,
          type: "buyers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BuyerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { buyer.reload.attributes }
    end
  end
end
