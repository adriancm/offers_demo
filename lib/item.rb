class Item

  @@items = {}

  attr_accessor :code, :name, :price, :offer_code

  def initialize(code, name, price, offer_code = nil)
    @code = code
    @name = name
    @price = price
    @offer_code = offer_code
    @@items.merge!({ code => self })
  end

  def self.get(code)
    @@items[code]
  end

  def self.all()
    @@items
  end
end