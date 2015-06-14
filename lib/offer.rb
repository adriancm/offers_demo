class Offer

  #Ya que esto es solo una demostracion, para probar el codigo sin necesidad de base de datos usamos un hash
  @@offers = {}

  attr_accessor :name, :formula

  def initialize(name, &formula)
    @name = name
    @formula = formula
    @@offers += { name => self }
  end

  def calc(item, amount)
    x
  end

  def self.get(name)
    @@offers[name]
  end

  def self.all
    @@offers
  end

end