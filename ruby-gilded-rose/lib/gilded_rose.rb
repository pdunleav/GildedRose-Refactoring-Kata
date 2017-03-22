require_relative '../aged_brie'
require_relative '../backstage_pass'
require_relative '../sulfuras'
require_relative '../regular_item'
require_relative '../conjured'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item_for(item).update
    end
  end

  def item_for(item)
    factory = {"Aged Brie" => AgedBrie.new(item), "Backstage passes to a TAFKAL80ETC concert" => BackstagePass.new(item), "Sulfuras, Hand of Ragnaros" => Sulfuras.new(item), "Conjured" => Conjured.new(item)}
    factory.fetch(item.name, RegularItem.new(item))
  end
end

