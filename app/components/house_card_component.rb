class HouseCardComponent < ViewComponent::Base
  def initialize(house:)
    @house = house
  end

  def list_price
    number_to_currency(@house.list_price)
  end

  def address
    @house.address
  end

  def year_built
    @house.year_built
  end
end
