require "./lib/item"
require "./lib/offer"

class Checkout

  attr_accessor :scanned_items

=begin
  pricing_rules = {
    items: [item_objects],
    offers: [offer_objects]
  }

  item_object = {
    code: :EX,
    name: "Example",
    price: 2.15,
    offer_code: "OF01"
  }

  offer_object = {
    code: :OF01,
    name: "2x1",
    formula: ->(item, amount){ (amount/2).ceil * item.price }
  }
=end
  def initialize(pricing_rules)
    pricing_rules[:items].each { |i| Item.new(i[:code], i[:name], i[:price], i[:offer_code]) }
    pricing_rules[:offers].each { |o| Offer.new(o[:code], o[:name], o[:formula]) }
    @scanned_items = {}
  end

  def scan(item)
    @scanned_items[item.code] = @scanned_items[item.code].to_i + 1
  end

  def total
    total = 0.0
    @scanned_items.each do |code, amount|
      i = Item.get(code)
      o = Offer.get(i.offer_code)
      price = o.nil? ? i.price * amount : o.formula.call(i, amount)
      puts "#{amount} #{code}: #{price}"
      total += price
    end
    total
  end

end