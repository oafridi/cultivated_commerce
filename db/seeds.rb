v1 = User.create(first_name:'Bob', last_name:'Marley', user_name:'chrisb', email:'bobmarley@gmail.com',
                 address_line_1:'277A Duncan st.', zipcode:'94131', about:'I play sax', phone:'555-717-5555', private_contact: true, 
                 user_img:'chris.jpg', password:'12345678', password_confirmation:'12345678')

v2 = User.create(first_name:'Osman', last_name:'Afridi', user_name:'osman', email: 'johnnycash@gmail.com', 
                 address_line_1:'59 Yale street', zipcode:'94134', about:'I get down', phone:'(555) 447-5555', private_contact: true, 
                 user_img:"osman.jpg", password:'12345678', password_confirmation:'12345678')

v3 = User.create(first_name:'John', last_name:'Belushi', user_name:'johhny', email:'michaeljackson@gmail.com', 
                 address_line_1:'59 silver ave', zipcode:'94134', about:'criminal', phone:'(555) 373-5555', private_contact: true, 
                 user_img:"murat.jpg", password:'12345678', password_confirmation:'12345678')

v4 = User.create(first_name:'Bob', last_name:'Marley', user_name:'vv', email: 'janetjackson@gmail.com',
                 address_line_1:'', zipcode:'94131', about:'fun loving', phone:'555-555-5555', private_contact: true, 
                 user_img:"murat.jpg", password:'12345678', password_confirmation:'12345678')

users = [v1, v2, v3, v4]

case Rails.env
when "development"
  10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, 
                user_name:Faker::Internet.user_name, email: Faker::Internet.email, 
                address_line_1: Faker::Address.street_name, zipcode: Faker::Address.zip_code, 
                about: Faker::Lorem.sentence, phone:Faker::PhoneNumber.phone_number, 
                private_contact: false, user_img: "user2" ,password:'12345678',
                password_confirmation:'12345678')
  end
end

produce = Item.create(kind:'Produce', category:'i-produce.svg')
eggsdairy = Item.create(kind:'Eggs and Dairy', category:'i-eggs_dairy.svg')
meatfish = Item.create(kind:'Meat and Fish', category:'i-meat_fish.svg')
bakedgoods = Item.create(kind:'Baked Goods', category:'i-bakery.svg')
pantry = Item.create(kind:'Pantry', category:'i-pantry.svg')
herbsspices = Item.create(kind:'Herbs and Spices', category:'i-herbs_spices.svg')

v1.listings.create(title:'Eggs', item_id: eggsdairy.id, description:'Eggs from my city chickens',desired:'apple',quantity:'3 dozen',image:"egg3.jpg",active:true)
v1.listings.create(title:'Eggs', item_id: eggsdairy.id, description:'A lot of extra eggs lorem ipsum',desired:'apple',quantity:'3 dozen', active:true, image: "egg1.jpg")
v1.listings.create(title:'Eggs', description:'Fresh eggs from our farm', item_id: eggsdairy.id, desired:'apple',quantity:'3 dozen',active:true, image: "egg2.jpg")
v1.listings.create(title:'Oranges', item_id: produce.id, description:'From my two orange trees. Large size.',desired:'Lemons',quantity:'3 dozen',image:"orange2.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',desired:'Avocado',quantity:'100',image:"lemon1.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id,description:'So many lemons for trade.',desired:'Avocado',quantity:'100',image:"lemon2.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',desired:'Avocado',quantity:'100',image:"lemon3.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',desired:'Avocado',quantity:'100',image:"lemon4.jpg",active:true)
v3.listings.create(title:'Persimmons', item_id: produce.id, description:'From my tree',desired:'Eggs',quantity:'30',image:"persimmons2.jpg",active:true)
v3.listings.create(title:'Heirloom Tomatoes', item_id: produce.id, description:'I have as many as I need. The rest are for trade.',desired:'Eggs',quantity:'50',image:"tomatoes1.jpg",active:true)
v3.listings.create(title:'Vine Tomatoes', item_id: produce.id, description:'Extra large. Extra tasty.',desired:'Avocado',quantity:'20',image:"tomatoes2.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',desired:'Oranges',quantity:'30 jars',image:"honey1.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',desired:'Oranges',quantity:'30 jars',image:"honey2.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',desired:'Oranges',quantity:'30 jars',image:"honey4.jpg",active:true)
v4.listings.create(title:'Honey',item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',desired:'Oranges',quantity:'30 jars',image:"honey6.jpg",active:true)
v4.listings.create(title:'Avocados', item_id: produce.id, description:'Haas avocados',desired:'Eggs',quantity:'40',image:"avocado.jpg",active:true)

users.each do |user|
  3.times do
    user.events.create(address_line_1: Faker::Address.street_name, zipcode: Faker::Address.zip_code, 
      city: Faker::Address.city, date:Faker::Date.forward(30), time:'9am - 1pm',
      title:Faker::Lorem.word, description:Faker::Lorem.sentence, 
      image:'', state:Faker::Address.state_abbr)
  end
end

EventsParticipant.create(participant_id:1, event_id:4)
EventsParticipant.create(participant_id:2, event_id:3)
EventsParticipant.create(participant_id:3, event_id:2)
EventsParticipant.create(participant_id:4, event_id:1)
EventsParticipant.create(participant_id:4, event_id:5)
EventsParticipant.create(participant_id:5, event_id:5)
EventsParticipant.create(participant_id:6, event_id:6)
EventsParticipant.create(participant_id:1, event_id:6)
EventsParticipant.create(participant_id:2, event_id:6)