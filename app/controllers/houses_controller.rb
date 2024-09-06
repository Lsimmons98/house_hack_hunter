class HousesController < ApplicationController
  def index
    @houses = House.all
    @house = House.new
    4.times { @house.units.build }
  end

  def show
    @house = House.find(params[:id])
    @deal = @house.deals.find_or_initialize_by(user: current_user)
  end

  def new
    @house = House.new
  end

  def create
    @houses = House.all
    @house = House.new(house_params)
    if @house.save
      redirect_to @house, notice: "House was successfully created."
    else
      render :index
    end
  end

  def house_params
    params.require(:house).permit(
      :address, :list_price, :annual_property_taxes, :year_built,
      units_attributes: [:id, :bedrooms, :bathrooms, :monthly_rent, :_destroy]
    )
  end
end
