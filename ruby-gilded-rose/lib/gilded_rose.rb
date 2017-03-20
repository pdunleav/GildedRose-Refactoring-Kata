class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              increase_quality_of(item)
            end
            if item.sell_in < 6
              increase_quality_of(item)
            end
          end
        end
      else
        update_regular_item(item)
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            update_regular_item(item)
          else
            item.quality = 0
          end
        else
          increase_quality_of(item)
        end
      end
    end
  end

  def update_regular_item(item)
    if item.quality > 0
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.quality -= 1
      end
    end
  end

  def increase_quality_of(item)
    if item.quality < 50
      item.quality += 1
    end
  end
end

