class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  # GET /buyers
  def index
    @buyers = Buyer.page(params[:page]).per(10)
  end

  # GET /buyers/1
  def show
    @message = Message.new
    @item = Item.new
    @user = User.new
  end

  # GET /buyers/new
  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers
  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to @buyer, notice: 'Buyer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /buyers/1
  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: 'Buyer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /buyers/1
  def destroy
    @buyer.destroy
    redirect_to buyers_url, notice: 'Buyer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def buyer_params
      params.fetch(:buyer, {})
    end
end
