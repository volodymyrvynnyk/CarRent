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
    image_url:'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/2017_Tesla_Model_X_front_5.27.18.jpg/1200px-2017_Tesla_Model_X_front_5.27.18.jpg',
    body:'SUV'
)

Car.create(
    brand:'Toyota',
    model:'Camry',
    description:'Divine toyota!!!',
    seats: 5,
    transmission:'automatic, 4x2',
    price: 300,
    image_url:'https://upload.wikimedia.org/wikipedia/commons/a/ac/2018_Toyota_Camry_%28ASV70R%29_Ascent_sedan_%282018-08-27%29_01.jpg',
    body:'Sedan'
)

Car.create(
    brand:'Renault',
    model:'Duster',
    description:'Crossover Duster 1.5dci',
    seats: 5,
    transmission:'manual, 4x4',
    price: 150,
    image_url:'https://upload.wikimedia.org/wikipedia/commons/3/3f/Dacia_Duster_TCe_125_4x2_Prestige_%28Facelift%29_%E2%80%93_Frontansicht%2C_13._Juli_2014%2C_Ratingen.jpg',
    body:'Suv'
)

Car.create(
    brand:'Mercedes-Benz',
    model:'Vito',
    description:'Vito 2.2cdti, 9 passangers',
    seats: 9,
    transmission:'manual, 4x2',
    price: 250,
    image_url:'https://upload.wikimedia.org/wikipedia/commons/c/c8/2019_Mercedes-Benz_Vito_Tourer_SELECT_119_BlueTec_2.1.jpg',
    body:'Van'
)