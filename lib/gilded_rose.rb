class GildedRose
  require_relative 'item_state_handler'

  def initialize(items)
    @items = items
  end
  require_relative 'functions'

  def update_quality
    @items.each do |item|
      ItemStateHandler.new(item).call
=begin
      case item.name
      when Conjured
        update_Conjured_Item(item)
      else
        update_Normal_Item(item)
      end
=end
    end 
  end
end
