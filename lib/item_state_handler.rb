class ItemStateHandler
    attr_accessor :item
  
    # Made an array for future modifying
    # like adding items with similar 
    # calculation method
    SULFURAS_ITEMS = ['Sulfuras, Hand of Ragnaros'].freeze
    AGED_BRIE_ITEMS = ['Aged Brie'].freeze
    BACKSTAGE_PASS_ITEMS = ['Backstage passes to a TAFKAL80ETC concert'].freeze
    CONJURED_ITEMS = ['Conjured'].freeze

    def initialize(item)
        @item = item
    end
    
    def call
        return if sulfuras_item?
        return aged_item_update if aged_brie_item?
        return backstage_item_update if backstage_item?
        return conjured_item_update if conjured_item?
        default_item_update
    end

    # Made private for better security
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

    def conjured_item?
        CONJURED_ITEMS.include?(item.name)
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

    def conjured_item_update
        if item.quality.positive?
          if item.sell_in.negative?
            add_sub_quality(-4)
          else
            add_sub_quality(-2)
          end
        end
    end

    def default_item_update
        if item.quality.positive?
          if item.sell_in.negative?
            add_sub_quality(-2)
          else
            add_sub_quality(-1)
          end
        end
        item.sell_in -= 1
    end
end