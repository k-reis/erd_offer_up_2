require 'rails_helper'

RSpec.describe BuyerResource, type: :resource do
  describe 'serialization' do
    let!(:buyer) { create(:buyer) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(buyer.id)
      expect(data.jsonapi_type).to eq('buyers')
    end
  end

  describe 'filtering' do
    let!(:buyer1) { create(:buyer) }
    let!(:buyer2) { create(:buyer) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: buyer2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([buyer2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:buyer1) { create(:buyer) }
      let!(:buyer2) { create(:buyer) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            buyer1.id,
            buyer2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            buyer2.id,
            buyer1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
