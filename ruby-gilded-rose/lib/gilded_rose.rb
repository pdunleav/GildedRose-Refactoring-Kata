require_relative '../aged_brie'
require_relative '../backstage_pass'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        AgedBrie.new(item).update
      when "Backstage passes to a TAFKAL80ETC concert"
        BackstagePass.new(item).update
      when "Sulfuras, Hand of Ragnaros"
      else
        update_regular_item(item)
      end
    end
  end

  def decrease_quality_of(item)
    if item.quality > 0
      item.quality -= 1
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

  def update_regular_item(item)
    item.sell_in -= 1
    decrease_quality_of(item)
    decrease_quality_of(item) if passed_sell_by?(item)
  end
end

