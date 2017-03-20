require_relative 'regular_item'

class Conjured < RegularItem

  def update_quality
    super * 2
  end
end
