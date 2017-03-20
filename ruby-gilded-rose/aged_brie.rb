require_relative 'regular_item'

class AgedBrie < RegularItem

  def update_item_quality
    @quality += 1 unless maximum_quality_reached?
  end
end
