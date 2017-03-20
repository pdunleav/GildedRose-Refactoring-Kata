class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        update_regular_item(item)
      else
        if item.quality < 50
          item.quality += 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              update_quality_of(item)
            end
            if item.sell_in < 6
              update_quality_of(item)
            end
          end
        end
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
          update_quality_of(item)
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

  def update_quality_of(item)
    if item.quality < 50
      item.quality += 1
    end
  end
end

