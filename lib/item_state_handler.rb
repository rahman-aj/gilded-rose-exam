class ItemStateHandler
    attr_accessor :item
  
    SULFURAS_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze
    AGED_BRIE_ITEMS = ['Aged Brie'].freeze

    def initialize(item)
        @item = item
    end
    
    def call
        return if sulfuras_item?
        return aged_item_update if aged_brie_item?
    end

    private

    def sulfuras_item?
        SULFURAS_ITEMS.include?(item.name) 
    end

    def aged_brie_item?
        AGED_BRIE_ITEMS.include?(item.name)
    end

    def add_sub_quality(val)
        return item.quality += val
    end

    def aged_item_update
        if item.quality < 50
          add_sub_quality(1)
        end
    end


end