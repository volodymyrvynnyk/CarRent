# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.delete_all

Car.create(
    brand:'Tesla',
    model:'Model X',
    description:'The coolest car in the world @Elon Musk',
    seats: 5,
    transmission:'automatic, 4x4',
    price: 500,
    image_url:'storage/images/modelx.jpeg',
    body:'SUV'
)

Car.create(
    brand:'Toyota',
    model:'Camry',
    description:'Divine toyota!!!',
    seats: 5,
    transmission:'automatic, 4x2',
    price: 300,
    image_url:'/home/vynnyk/GitHub/CarRent/CarRent/storage/images/camry.jpeg',
    body:'Sedan'
)

Car.create(
    brand:'Renault',
    model:'Duster',
    description:'Crossover Duster 1.5dci',
    seats: 5,
    transmission:'manual, 4x4',
    price: 150,
    image_url:'jetbrains://rubymine/navigate/reference?project=CarRent&path=storage/images/duster.jpeg',
    body:'Suv'
)

Car.create(
    brand:'Mercedes-Benz',
    model:'Vito',
    description:'Vito 2.2cdti, 9 passangers',
    seats: 9,
    transmission:'manual, 4x2',
    price: 250,
    image_url:'storage/images/vito.jpg',
    body:'Van'
)