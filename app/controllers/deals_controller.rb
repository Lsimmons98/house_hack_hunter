class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.for_user(current_user.id)
  end

  def new
    @house = House.find(params[:house_id])
    @deal = @house.deals.new
  end

  def create
    @house = House.find(params[:house_id])
    @deal = @house.deals.new(deal_params)
    @deal.user = current_user

    if @deal.save
      redirect_to house_path(@house), notice: "Deal was successfully created."
    else
      render :new
    end
  end

  def edit
    @house = House.find(params[:house_id])
    @deal = @house.deals.find(params[:id])
  end

  def update
    @house = House.find(params[:house_id])
    @deal = @house.deals.find(params[:id])

    if @deal.update(deal_params)
      redirect_to house_path(@house), notice: "Deal was successfully updated."
    else
      render :edit
    end
  end

  private

  def deal_params
    params.require(:deal).permit(
      :interest_rate, :down_payment_percentage, :purchase_price,
      :loan_term_years, :rehab_cost, :holding_cost,
      :utilities, :lawn_care, :insurance,
      :vacancy, :maintenance, :capital_expenditure,
      :property_management, :closing_costs
    )
  end
end
