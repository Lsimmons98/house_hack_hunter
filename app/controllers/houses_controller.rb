class HousesController < ApplicationController
  before_action :set_house, only: [:show, :update]

  def index
    @houses = House.all
    @house = House.new
    4.times { @house.units.build }
  end

  def show; end

  def create
    @houses = House.all
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: "House was successfully created."
    else
      render :index
    end
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house), notice: "House was successfully updated."
    else
      render :show
    end
  end

  def house_params
    params.require(:house).permit(
      :address, :list_price, :annual_property_taxes, :year_built,
      units_attributes: [:id, :bedrooms, :bathrooms, :monthly_rent, :_destroy]
    )
  end

private

  def set_house
    @house = House.find(params[:id])
    @deal = @house.deals.find_or_initialize_by(user: current_user)
  end
end
