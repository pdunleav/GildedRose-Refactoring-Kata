class AgedBrie < RegularItem

  def increase_quality
    if @quality < 50
      @quality += 1
    end
  end
end
