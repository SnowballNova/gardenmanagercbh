puts "Destroying everything..."

Garden.destroy_all

puts "Everything destroyed!"

gardens_attributes = [
  { name: "French garden", picsum_id: "18" },
  { name: "My Cute Balcony", picsum_id: "89" },
  { name: "English garden", picsum_id: "94" },
  { name: "Flowered patio", picsum_id: "98" },
  { name: "Garden in Japan", picsum_id: "167" },
  { name: "Walk among flowers", picsum_id: "217" }
]

plants_picsum_ids = [106, 239, 248, 306]

gardens_attributes.each do |garden_attributes|
  garden_name = garden_attributes[:name]
  garden_banner_url = "https://picsum.photos/id/#{garden_attributes[:picsum_id]}/800/400"

  puts "Creating #{garden_name}..."

  garden = Garden.new(name: garden_name, banner_url: garden_banner_url)
  garden.save!

  3.times do
    image_url = "https://picsum.photos/id/#{plants_picsum_ids.sample}/800/400"

    plant = Plant.new(name: Faker::FunnyName.name, image_url: image_url, garden: garden)
    plant.save!

    sleep(1)
  end

  puts "#{garden_name} created!"
end
