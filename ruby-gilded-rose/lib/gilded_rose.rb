require_relative '../aged_brie'
require_relative '../backstage_pass'
require_relative '../sulfuras'
require_relative '../regular_item'

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
        Sulfuras.new(item).update
      else
        RegularItem.new(item).update
      end
    end
  end
end

