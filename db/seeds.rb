# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts 'Cleaning database...'
Location.destroy_all
User.destroy_all
Album.destroy_all

puts 'creating fake user'
first_user = User.create(password: '123456', email: 'ze@ninguem.com')

puts 'creating fakes locations'
places = ['Lagoa, Rio de Janeiro', 'Botafogo, Rio de Janeiro', 'Humaitá, Rio de Janeiro',
        'Ipanema, Rio de Janeiro', 'Tijuca, Rio de Janeiro']
count = 0
places.each do |element|
    location = Location.create!(address: element, user_id: first_user.id)
    puts "place id: #{location.id}- location: #{location.address}"
    count +=1
    puts "(#{count} of #{places.count} done)"
end

puts 'creating fakes albums'
images = ['https://claudia.abril.com.br/wp-content/uploads/2020/01/familia-feliz-40589-1.jpg?quality=85&strip=info',
            'https://www.webventure.com.br/wp-content/uploads/2018/10/1_6q1-rTOP10j1qV9A7ACm_g.jpeg',
            'http://s2.glbimg.com/X3JS3jXmtCn2DgPTt5L3daCsI9I=/620x453/e.glbimg.com/og/ed/f/original/2017/05/22/safari_wilderness_ranch_family_views_ostrich_3_compressed_.jpg',
            'https://estrelaguianews.com.br/wp-content/uploads/2018/03/A-51.jpg', 
            'https://www.omelhordavida.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/f/a/familia-brincando-38501-editada.jpg']
sum = 0
images.each do |element|
    album = Album.create!(date: rand(10).years.ago, location_id: Location.first.id + sum)
    puts "album id: #{album.id}- date: #{album.date}"
    file = open(images[sum])
    album.photos.attach(io: file, filename: 'some-image.jpg')
    sum +=1
    puts "(#{sum} of #{images.count} done)"
end
puts 'done'