class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality_of(item)
      else
        decrease_quality_of(item)
      end
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 11
          increase_quality_of(item)
        end
        if item.sell_in < 6
          increase_quality_of(item)
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name == "Aged Brie"
          increase_quality_of(item)
        elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality = 0
        else
          decrease_quality_of(item)
        end
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
    item.sell_on < 0
  end
end

