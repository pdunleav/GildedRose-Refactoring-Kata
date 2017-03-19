require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "AgedBrie" do
    it "increases in quality as time passes"
  end

  describe "Sulfuras" do
    it "never has to be sold"

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
