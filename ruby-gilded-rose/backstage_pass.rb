require_relative 'regular_item'

class BackstagePass < RegularItem

  def update_quality
    if @sell_in < 6 && not_passed_sell_by?
      3.times do
        @quality += 1 unless maximum_quality_reached?
      end
    elsif @sell_in < 11
      2.times do
        @quality += 1 unless maximum_quality_reached?
      end
    else
      @quality += 1 unless maximum_quality_reached?
    end
  end
end
