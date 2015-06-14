class Item

  @@items = {}

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
    @@items += { code => self }
  end

end