require_relative '../lib/gilded_rose'
require_relative '../lib/item'
require_relative 'spec_helper'

describe GildedRose do

  describe "Regular Item" do
    let(:item) { Item.new("Regular Item", 8, 20) }
    let(:gr) { GildedRose.new([item]) }

    it "decreases in quality as time passes" do
      expect{gr.update_quality}.to change{item.quality}.by(-1)
    end

    it "never has a quality less than 0" do
      50.times do
        gr.update_quality
      end
      expect(item.quality).to eq(0)
    end

    context "when the sell by date has passed" do
      it "decreases in quality twice as fast" do
        item.sell_in = 0
        expect{gr.update_quality}.to change{item.quality}.by(-2)
      end
    end
  end

  describe "Conjured Item" do
    let(:item) { Item.new("Conjured", 8, 20) }
    let(:gr) { GildedRose.new([item]) }

    describe "decreases in quality twice as fast as regular items" do
      it "decreases in quality as time passes" do
        expect{gr.update_quality}.to change{item.quality}.by(-2)
    end

    it "never has a quality less than 0" do
      50.times do
        gr.update_quality
      end
      expect(item.quality).to eq(0)
    end

    context "when the sell by date has passed" do
      it "decreases in quality twice as fast" do
        item.sell_in = 0
        expect{gr.update_quality}.to change{item.quality}.by(-4)
      end
    end
    end
  end

  describe "AgedBrie" do
    let(:item) { Item.new("Aged Brie", 10, 10) }
    let(:gr) { GildedRose.new([item]) }

    it "increases in quality as time passes" do
      expect{gr.update_quality}.to change{item.quality}.by(1)
    end

    it "never has a quality greater than 50" do
      50.times do
        gr.update_quality
      end
      expect(item.quality).to eq(50)
    end
  end

  describe "Sulfuras" do
    let(:item) { Item.new("Sulfuras, Hand of Ragnaros", 10, 80) }
    let(:gr) { GildedRose.new([item]) }

    it "never has to be sold" do
      expect{gr.update_quality}.to change{item.sell_in}.by(0)
    end

    it "does not decrease in quality" do
      10.times do
        gr.update_quality
      end
      expect(item.quality).to eq(80)
    end
  end

  describe "BackstagePasses" do
    let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20) }
    let(:gr) { GildedRose.new([item]) }

    it "increases in quality as time passes" do
      expect{gr.update_quality}.to change{item.quality}.by(1)
    end

    it "has no quality after the concert" do
      50.times do
        gr.update_quality
      end
      expect(item.quality).to eq(0)
    end

    context "when there are 10 days or less until the concert" do
      let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10) }
      let(:gr) { GildedRose.new([item]) }

      it "increases in quality by 2" do
        expect{gr.update_quality}.to change{item.quality}.by(2)
      end
    end

    context "when there are 5 days or less until the concert" do
      let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10) }
      let(:gr) { GildedRose.new([item]) }

      it "increases in quality by 3" do
        expect{gr.update_quality}.to change{item.quality}.by(3)
      end
    end
  end
end
