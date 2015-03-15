v1 = User.create(first_name:'Bob', last_name:'Marley', user_name:'chrisb', 
                 email:'bobmarley@gmail.com', address_line_1:'59 yale street', 
                 zipcode:'94134', about:'I play sax', phone:'555-717-5555', 
                 private_contact: true, img:'chris.jpg', password:'12345678', 
                 password_confirmation:'12345678')

v2 = User.create(first_name:'Bob', last_name:'Marley', user_name:'chrisb', 
                 email:'bobmarlet@gmail.com', address_line_1:'59 yale street', 
                 zipcode:'94134', about:'I play sax', phone:'555-717-5555', 
                 private_contact: true, img:'chris.jpg', password:'12345678', 
                 password_confirmation:'12345678')

v3 = User.create(first_name:'Bob', last_name:'Marley', user_name:'chrisb', 
                 email:'bobmarler@gmail.com', address_line_1:'59 yale street', 
                 zipcode:'94134', about:'I play sax', phone:'555-717-5555', 
                 private_contact: true, img:'chris.jpg', password:'12345678', 
                 password_confirmation:'12345678')

v4 = User.create(first_name:'Bob', last_name:'Marley', user_name:'chrisb', 
                 email:'bobmarlee@gmail.com', address_line_1:'59 yale street', 
                 zipcode:'94134', about:'I play sax', phone:'555-717-5555', 
                 private_contact: true, img:'chris.jpg', password:'12345678', 
                 password_confirmation:'12345678')

produce = Item.create(kind:'Produce', category:'i-produce.svg')
eggsdairy = Item.create(kind:'Eggs and Dairy', category:'i-eggs_dairy.svg')
meatfish = Item.create(kind:'Meat and Fish', category:'i-meat_fish.svg')
bakedgoods = Item.create(kind:'Baked Goods', category:'i-bakery.svg')
pantry = Item.create(kind:'Pantry', category:'i-pantry.svg')
herbsspices = Item.create(kind:'Herbs and Spices', category:'i-herbs_spices.svg')

v1.listings.create(title:'Eggs', item_id: eggsdairy.id, description:'Eggs from my city chickens', 
                    desired:'apple',quantity:'3 dozen',image:"egg3.jpg",active:true)
v1.listings.create(title:'Eggs', item_id: eggsdairy.id, description:'A lot of extra eggs lorem ipsum',
    desired:'apple',quantity:'3 dozen', active:true, image: "egg1.jpg")
v1.listings.create(title:'Eggs', description:'Fresh eggs from our farm', item_id: eggsdairy.id, 
    desired:'apple',quantity:'3 dozen',active:true, image: "egg2.jpg")
v1.listings.create(title:'Oranges', item_id: produce.id, description:'From my two orange trees. Large size.',
    desired:'Lemons',quantity:'3 dozen',image:"orange2.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',
    desired:'Avocado',quantity:'100',image:"lemon1.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id,description:'So many lemons for trade.',
    desired:'Avocado',quantity:'100',image:"lemon2.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',
    desired:'Avocado',quantity:'100',image:"lemon3.jpg",active:true)
v2.listings.create(title:'Meyer Lemons', item_id: produce.id, description:'So many lemons for trade.',
    desired:'Avocado',quantity:'100',image:"lemon4.jpg",active:true)
v3.listings.create(title:'Persimmons', item_id: produce.id, description:'From my tree',
    desired:'Eggs',quantity:'30',image:"persimmons2.jpg",active:true)
v3.listings.create(title:'Heirloom Tomatoes', item_id: produce.id, description:'I have as many as I need. The rest are for trade.',
    desired:'Eggs',quantity:'50',image:"tomatoes1.jpg",active:true)
v3.listings.create(title:'Vine Tomatoes', item_id: produce.id, description:'Extra large. Extra tasty.',
    desired:'Avocado',quantity:'20',image:"tomatoes2.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',
    desired:'Oranges',quantity:'30 jars',image:"honey1.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',
    desired:'Oranges',quantity:'30 jars',image:"honey2.jpg",active:true)
v4.listings.create(title:'Honey', item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',
    desired:'Oranges',quantity:'30 jars',image:"honey4.jpg",active:true)
v4.listings.create(title:'Honey',item_id: pantry.id, description:'I have a small behive up north and I bring back honey to trade.',
    desired:'Oranges',quantity:'30 jars',image:"honey6.jpg",active:true)
v4.listings.create(title:'Avocados', item_id: produce.id, description:'Haas avocados',
    desired:'Eggs',quantity:'40',image:"avocado.jpg",active:true)

v1.events.create(address_line_1:'590 Dolores St', city: 'San Francisco',
                 zipcode:'94110', date:Faker::Date.forward(30), time:'9am - 1pm', 
                 title:'Delores Park exchange', description:'come see me!', 
                 image:'', state: "CA")

v1.events.create(address_line_1:'1089 Fulton St', city: 'San Francisco', 
                 zipcode:'94117', date:Faker::Date.forward(30), time:'9am - 1pm',
                 title:'Alamo Square Park exchange', 
                 description:'I will be setting up a table and canopy. Join in if you want.', 
                 image:'', state: "CA")

v2.events.create(address_line_1:'2490 Folsom St', city: 'San Francisco', 
                 zipcode:'94110', date:Faker::Date.forward(30), time:'1pm',
                 title:'Jose Coronado Playground exchange', 
                 description:'I can meet here at this time.', 
                 image:'', state: "CA")

v2.events.create(address_line_1:'2056 Sacramento St', city: 'San Francisco', 
                 zipcode:'94109', date:Faker::Date.forward(30), time:'10am',
                 title:'Lafayette Park exchange', 
                 description:'I will setup a table by the tennis courts.', 
                 image:'', state: "CA")

v3.events.create(address_line_1:'333 Post St ', city: 'San Francisco', 
                 zipcode:'94108', date:Faker::Date.forward(30), time:'11am',
                 title:'Union Square exchange', 
                 description:'I have a table and will be setup by', 
                 image:'', state: "CA")

v3.events.create(address_line_1:'320 Dolores St', city: 'San Francisco', 
                 zipcode:'94110', date:Faker::Date.forward(30), time:'9am',
                 title:'Mission Delores exchange', 
                 description:'My house is nearby', 
                 image:'', state: "CA")

v4.events.create(address_line_1:'585 Duboce Ave', city: 'San Francisco', 
                 zipcode:'94117', date:Faker::Date.forward(30), time:'1pm',
                 title:'Duboce Park exchange', 
                 description:'I will be setup right by the MUNI on/off ramp.', 
                 image:'', state: "CA")

EventsParticipant.create(participant_id:1, event_id:4)
EventsParticipant.create(participant_id:2, event_id:3)
EventsParticipant.create(participant_id:3, event_id:2)
EventsParticipant.create(participant_id:4, event_id:1)
EventsParticipant.create(participant_id:4, event_id:5)
EventsParticipant.create(participant_id:5, event_id:5)
EventsParticipant.create(participant_id:6, event_id:6)
EventsParticipant.create(participant_id:1, event_id:6)
EventsParticipant.create(participant_id:2, event_id:6)