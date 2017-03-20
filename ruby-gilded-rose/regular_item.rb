require_relative 'item'

class RegularItem < Item

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    if @quality > 0 && passed_sell_by?
      @quality -= 2
    elsif @quality > 0
      @quality -=1
    end
  end

  def decrease_sell_in
    @sell_in -= 1
  end

  def passed_sell_by?
    @sell_in < 0
  end

  def not_passed_sell_by?
    @sell_in >= 0
  end

  def maximum_quality_reached?
    @quality == 50
  end
end
