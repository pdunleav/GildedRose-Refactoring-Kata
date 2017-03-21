class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless item.name == "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      case item.name
      when "Aged Brie"
        increase_quality_of(item)
        increase_quality_of(item) if passed_sell_by?(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        increase_quality_of(item)
        if item.sell_in < 11
          increase_quality_of(item)
        end
        if item.sell_in < 6
          increase_quality_of(item)
        end
        item.quality = 0 if passed_sell_by?(item)
      else
        decrease_quality_of(item)
        decrease_quality_of(item) if passed_sell_by?(item)
      end
    end
  end

  def decrease_quality_of(item)
    if item.quality > 0
      item.quality -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
    end
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

