class RegularItem

  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def update
    item.sell_in -= 1
    decrease_quality_of(item)
    decrease_quality_of(item) if passed_sell_by?(item)
  end

  def decrease_quality_of(item)
    if item.quality > 0
      item.quality -= 1
    end
  end

  def passed_sell_by?(item)
    item.sell_in < 0
  end
end
