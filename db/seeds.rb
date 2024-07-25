puts "Destroy all"
Post.destroy_all
Wall.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

puts "Creating Users"

User.create!(
  email: 'yannis.gaspard@gmail.com',
  nickname: 'Yannis',
  description: 'I am a young guy from Toulouse, hip-hop enthusiast and street art lover ! I want to learn english !',
  spoken_language: 'French',
  learning_language: 'English',
  password: 'password1',
  photo: 'https://media.licdn.com/dms/image/C4E03AQERbi3ilMhlZA/profile-displayphoto-shrink_800_800/0/1650007834660?e=1727308800&v=beta&t=cbrYcSnxgka40XfefzXr01t-VzUm7oHfcWRBAz3HwgE'
)

User.create!(
  email: 'user1@example.com',
  nickname: 'Alex',
  description: 'I am a Software Engineer at Google',
  spoken_language: 'Spanish',
  learning_language: 'English',
  password: 'password1',
  photo: 'https://img.freepik.com/photos-gratuite/portrait-homme-affaires-souriant_23-2148746289.jpg?t=st=1721907354~exp=1721910954~hmac=b93a45a41a1bdc2e71eacd3bd8402fb33da2efa440e2c9e9ab1462872ccfdcf4&w=996'
)

User.create!(
  email: 'user2@example.com',
  nickname: 'Yamamoto',
  description: 'I am a Graphic Designer at Microsoft',
  spoken_language: 'Japanese',
  learning_language: 'English',
  password: 'password2',
  photo: 'https://img.freepik.com/photos-gratuite/femme-architecte-asiatique_53876-31462.jpg?t=st=1721907391~exp=1721910991~hmac=c7d7676c0059864a53a2190919417d737cdeb5b803d3a5220164b7d29b3f5250&w=996'
)

User.create!(
  email: 'user2@example.com',
  nickname: 'Ryan',
  description: 'I am a Graphic Designer at Microsoft',
  spoken_language: 'English',
  learning_language: 'Japanese',
  password: 'password2',
  photo: 'https://img.freepik.com/photos-gratuite/vue-avant-du-smiley-pere-tenant-tablette_23-2148414871.jpg?t=st=1721907432~exp=1721911032~hmac=cd39dcb7dbcf3be16cf313273ace290799496ac71d257f67b37e4b05d7af701e&w=996'
)

User.create!(
  email: 'user3@example.com',
  nickname: 'Michaela',
  description: 'I am a baker in Marseille',
  spoken_language: 'French',
  learning_language: 'Polish',
  password: 'password3',
  photo: 'https://img.freepik.com/photos-gratuite/femme-affaires-heureuse-etre-retour-au-travail_23-2148727621.jpg?t=st=1721907477~exp=1721911077~hmac=a0d22db040dda1b2466c8cf6997a28c18501ac8ed4fee7b7bff9a98632c8c0c2&w=996'
)

User.create!(
  email: 'user4@example.com',
  nickname: 'Fabiola',
  description: 'I am a big companys CEO',
  spoken_language: 'Italian',
  learning_language: 'Dutch',
  password: 'password4',
  photo: 'https://img.freepik.com/photos-gratuite/femme-affaires-attrayant-travaillant-son-ordinateur-portable_158595-1122.jpg?t=st=1721907539~exp=1721911139~hmac=3bca3f63911c23d0378c97f6d164cc5a2193a4615107cae326a104972918fb7a&w=996'
)

User.create!(
  email: 'chatbot@calypso.com',
  nickname: 'Chatbot',
  description: 'I am here to support you my friend !',
  spoken_language: 'All Languages',
  learning_language: 'All Languages',
  password: 'chatbot',
  photo: 'https://img.freepik.com/photos-gratuite/rendu-3d-conception-avatar-ligne_23-2149699872.jpg?w=996&t=st=1721907670~exp=1721908270~hmac=bd2a73573aeec5d0b2e7b2bb352cc8c5dd362f11edc219466309c16e5b0d594f'
)

# Wall.create!(chatroom_id: Chatroom.first.id)
# Message.destroy_all
# Wall.destroy_all
# Chatroom.destroy_all

puts "Creating Chatroom"

Chatroom.create!(
  name: "Welcome !",
  password: "",
  status: "public",
  language: "all languages",
  language_level: "advanced",
  topic: "a chat around the world",
  security_level: ""
)

Chatroom.create!(
  name: "Human lore",
  password: "",
  status: "private",
  language: "english",
  language_level: "advanced",
  topic: "history",
  security_level: ""
)

Chatroom.create!(
  name: "pa comer rico",
  password: "",
  status: "public",
  language: "spanish",
  language_level: "fluent",
  topic: "food",
  security_level: ""
)

Chatroom.create!(
  name: "Foot",
  password: "",
  status: "private",
  language: "french",
  language_level: "beginner",
  topic: "sports",
  security_level: ""
)

Chatroom.create!(
  name: "Viajar com amigos",
  password: "",
  status: "private",
  language: "portuguese",
  language_level: "medium",
  topic: "travel",
  security_level: ""
)

Chatroom.create!(
  name: "Cantare in Napoli",
  password: "",
  status: "private",
  language: "italian",
  language_level: "advanced",
  topic: "music",
  security_level: ""
)

puts "Creating Wall"
Chatroom.find_each do |chatroom|
  Wall.create!(chatroom_id: chatroom.id)
end

chatroom = Chatroom.find_by(name: "Welcome !")
Message.create!(
  content: "Welcome to Calypso, the best way to learn a new language without noticing it! Chat with people from all over the world who want to learn and discuss their interests! To get started, select a chatroom of interest on the left and off you go!",
  chatroom: chatroom,
  user: User.find_by(nickname: "Chatbot")
)
