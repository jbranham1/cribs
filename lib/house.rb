class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price.gsub("$","").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    @rooms.map do |room|
      room.area
    end.sum
  end

  def details
    hash = {
      "price" => @price,
      "address" => @address
    }
  end

  def price_per_square_foot
    round_price(@price / area.to_f)
  end

  def round_price(price)
    price.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end
end
