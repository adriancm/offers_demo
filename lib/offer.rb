class Offer

  #Ya que esto es solo una demostracion, para probar el codigo sin necesidad de base de datos usamos un hash
  @@offers = {}

  attr_accessor :code, :name, :formula

  def initialize(code, name, formula)
    @code = code
    @name = name
    @formula = formula
    @@offers.merge!({ code => self })
  end

  def self.get(code)
    @@offers[code]
  end

  def self.all
    @@offers
  end

end