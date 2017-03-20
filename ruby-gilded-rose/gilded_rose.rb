require_relative "item"
require_relative "aged_brie"
require_relative "backstage_pass"
require_relative "conjured"
require_relative "sulfuras"
require_relative "regular_item"

class GildedRose

  def initialize(items)
    @items = []
    items.each do |item|
      if item.name == "Aged Brie"
        @items << AgedBrie.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
         @items << BackstagePass.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
         @items << Sulfuras.new(item.name, item.sell_in, item.quality)
      elsif item.name == "Conjured"
         @items << Conjured.new(item.name, item.sell_in, item.quality)
      else
        @items << RegularItem.new(item.name, item.sell_in, item.quality)
      end
    end
    @items
  end

  def update_quality()
    @items.each do |item|
      item.update_item_quality
      item.decrease_sell_in
    end
  end
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality -= 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality += 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality += 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality += 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in -= 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality -= 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality += 1
  #         end
  #       end
  #     end
  #   end
  # end
end
