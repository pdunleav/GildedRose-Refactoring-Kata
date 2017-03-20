require_relative 'regular_item'

class AgedBrie < RegularItem

  def update_quality
    @quality += 1 unless reached_maximum_quality?
  end
end
