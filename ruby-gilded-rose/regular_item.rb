class RegularItem < Item

  def update
    update_quality
    update_sell_in
  end

  def decrease_quality
    if @quality > 0 && @sell_in <= 0
      @quality -= 2
    elsif @quality > 0
      @quality -=1
    end
  end

  def decrease_sell_in
    @sell_in -= 1
  end
end
