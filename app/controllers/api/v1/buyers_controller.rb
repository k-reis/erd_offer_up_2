class Api::V1::BuyersController < Api::V1::GraphitiController
  def index
    buyers = BuyerResource.all(params)
    respond_with(buyers)
  end

  def show
    buyer = BuyerResource.find(params)
    respond_with(buyer)
  end

  def create
    buyer = BuyerResource.build(params)

    if buyer.save
      render jsonapi: buyer, status: 201
    else
      render jsonapi_errors: buyer
    end
  end

  def update
    buyer = BuyerResource.find(params)

    if buyer.update_attributes
      render jsonapi: buyer
    else
      render jsonapi_errors: buyer
    end
  end

  def destroy
    buyer = BuyerResource.find(params)

    if buyer.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: buyer
    end
  end
end
