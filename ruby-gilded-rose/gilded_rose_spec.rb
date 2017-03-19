require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "Regular Item" do
    let(:item) { Item.new("Normal Item", 8, 20) }
    let(:gr) { GildedRose.new([item]) }

    it "decreases in quality as time passes" do
      gr.update_quality
      expect(item.quality).to eq(19)
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

  describe "AgedBrie" do
    let(:item) { Item.new("Aged Brie", 10, 10) }
    let(:gr) { GildedRose.new([item]) }

    it "increases in quality as time passes" do
      gr.update_quality
      expect(item.quality).to be(11)
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
      gr.update_quality
      expect(item.sell_in).to be(10)
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
      gr.update_quality
      expect(item.quality).to be > 10
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
        gr.update_quality
        expect(item.quality).to eq(12)
      end
    end

    context "when there are 5 days or less until the concert" do
      let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10) }
      let(:gr) { GildedRose.new([item]) }

      it "increases in quality by 3" do
        gr.update_quality
        expect(item.quality).to eq(13)
      end
    end
  end
end
