require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "AgedBrie" do
    it "increases in quality as time passes" do
      item = Item.new("Aged Brie", 10, 10)
      gr = GildedRose.new([item])
      gr.update_quality
      expect(item.quality).to be(11)
    end
  end

  describe "Sulfuras" do
    it "never has to be sold" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 10, 80)
      gr = GildedRose.new([item])
      gr.update_quality
      expect(item.sell_in).to be(10)
    end

    it "does not decrease in quality"

    it "always has a quality of 80"
  end

  describe "BackstagePasses" do
    it "increases in quality as time passes"

    it "has no quality after the concert"

    context "when there are 10 days or less until the concert" do
      it "increases in quality by 2"
    end

    context "when there are 5 days or less until the concert" do
      it "increases in quality by 3"
    end
  end
end
