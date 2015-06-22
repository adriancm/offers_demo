#!/usr/local/env ruby

require "./lib/checkout"
require "./lib/item"
require "./lib/offer"

pricing_rules = {
    items: [{
                code: :AM,
                name: "Agua Mineral",
                price: 3.11,
                offer_code: :OF01
            },{
                code: :AC,
                name: "Aceite",
                price: 5.00,
                offer_code: :OF02
            },{
                code: :CA,
                name: "Cafe",
                price: 11.23
            }],
    offers: [{
                 code: :OF01,
                 name: "2x1",
                 formula: ->(item, amount){ (amount.to_f/2).ceil * item.price }
             },{
                 code: :OF02,
                 name: "3 o mas a 4.50",
                 formula: ->(item, amount){ amount >= 3 ? 4.5 * amount.to_f : item.price * amount.to_f }
             }]
}

inputs_1 = [:AM, :AC, :AM, :AM, :CA]
inputs_2 = [:AM, :AM]
inputs_3 =  [:AC, :AC, :AM, :AC]

co = Checkout.new(pricing_rules)

inputs_1.each { |i| co.scan(Item.get(i)) }

puts "Example 1: #{co.total}"

co = Checkout.new(pricing_rules)

inputs_2.each { |i| co.scan(Item.get(i)) }

puts "Example 2: #{co.total}"

co = Checkout.new(pricing_rules)

inputs_3.each { |i| co.scan(Item.get(i)) }

puts "Example 3: #{co.total}"

exit