# frozen_string_literal: true

Item.destroy_all
Category.destroy_all
overwatch = Category.create(name: "Overwatch", description: "Un super jeux vous allez bien vous amusez")
bojack = Category.create(name: "BojackHorseman", description: "Un cheval alcoolique essayant de redevenir une start à la mode")
football = Category.create(name: "Football", description: "Le foot c'est super sympa")
1.upto(5) do |i|
  Item.create!(
    original_price: Faker::Number.decimal(2), name: Faker::Overwatch.hero
  )
  Categorization.create(item_id: Item.last.id, category_id: overwatch.id)
  Item.create!(
    original_price: Faker::Number.decimal(2), name: Faker::BojackHorseman.character
  )
  Categorization.create(item_id: Item.last.id, category_id: bojack.id)
  Item.create!(
    original_price: Faker::Number.decimal(2), name: Faker::Football.player
  )
  Categorization.create(item_id: Item.last.id, category_id: football.id)
  p "ITEM #{i} : créé"
end
