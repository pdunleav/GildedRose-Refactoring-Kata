class AgedBrie

  attr_accessor :item

  def initialize(item)
  	@item = item
  end

  def update
    item.sell_in -= 1
    increase_quality_of(item)
    increase_quality_of(item) if passed_sell_by?(item)
  end

  def increase_quality_of(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  def passed_sell_by?(item)
    item.sell_in < 0
  end
end
