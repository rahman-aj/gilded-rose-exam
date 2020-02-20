class ItemStateHandler
    attr_accessor :item
  
    SULFURAS_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze
    AGED_BRIE_ITEMS = ['Aged Brie'].freeze
    BACKSTAGE_PASS_ITEMS = ['Backstage passes to a TAFKAL80ETC concert'].freeze

    def initialize(item)
        @item = item
    end
    
    def call
        return if sulfuras_item?
        return aged_item_update if aged_brie_item?
        return backstage_item_update if backstage_item?
    end

    private

    def sulfuras_item?
        SULFURAS_ITEMS.include?(item.name) 
    end

    def aged_brie_item?
        AGED_BRIE_ITEMS.include?(item.name)
    end

    def backstage_item?
        BACKSTAGE_PASS_ITEMS.include?(item.name)
    end

    def add_sub_quality(val)
        return item.quality += val
    end

    def aged_item_update
        if item.quality < 50
          add_sub_quality(1)
        end
    end

    def backstage_item_update
        return item.quality = 0 if item.sell_in.zero? || item.sell_in.negative?
        return add_sub_quality(3) if item.sell_in <= 5
        return add_sub_quality(2) if item.sell_in <= 10
        return add_sub_quality(1) 
    end

end