require "faker"

10.times do
  Restaurant.create!(
    name: Faker::Pokemon.name,
    address: Faker::Pokemon.location
  )
end
