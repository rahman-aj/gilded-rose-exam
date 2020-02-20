class ItemStateHandler
    attr_accessor :item
  
    SULFURAS_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze

    def initialize(item)
        @item = item
    end
    
    def call
        return if sulfuras_item?
    end

    private

    def sulfuras_item?
        SULFURAS_ITEMS.include?(item.name) 
    end


end