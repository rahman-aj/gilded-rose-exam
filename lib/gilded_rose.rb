class GildedRose
  require_relative 'item_state_handler'

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      ItemStateHandler.new(item).call
    end 
  end
end
