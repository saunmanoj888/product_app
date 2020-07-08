User.all.each do |user|
  5000.times do
    user.products.create(
      name:Faker::Company.name,
      model: SecureRandom.hex(4),
      brand:Faker::Appliance.brand,
      released_date: Faker::Date.between(from: 200.days.ago, to: Date.today),
      ram: rand(8..32),
      external_storage: rand(32..128)
    )
  end
end