# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# chatroom1 = Chatroom.create(name: "Calypso", password: "", status: "private", language:"french", language_level:"advanced", topic: "anime", security_level: "solid")

# User.create!(email: 'user1@example.com',
#   nickname: 'Alex',
#   description: 'I am a Software Engineer at Google',
#   spoken_language: 'Spanish',
#   learning_language: 'German',
#   password: 'password1')


# User.create!(email: 'user2@example.com',
#   nickname: 'Ryan',
#   description: 'I am a Graphic Designer at Microsoft',
#   spoken_language: 'Japanese',
#   learning_language: 'English',
#   password: 'password2')

# User.create(email: 'user2@example.com') do |user|
#   user.nickname = 'Ryan'
#   user.description = 'I am a Graphic Designer at Microsoft'
#   user.spoken_language = 'Japanese'
#   user.learning_language = 'English'
#   user.password = 'password2'
# end

# User.create(email: 'user3@example.com') do |user|
#   user.nickname = 'Michael'
#   user.description = 'I am a baker in Marseille'
#   user.spoken_language = 'French'
#   user.learning_language = 'Polish'
#   user.password = 'password3'
# end

# User.create(email: 'user4@example.com') do |user|
#   user.nickname = 'Fabiola'
#   user.description = 'I am a big companys CEO'
#   user.spoken_language = 'Mandarin'
#   user.learning_language = 'Dutch'
#   user.password = 'password4'
# end


# Wall.create!(chatroom_id: Chatroom.first.id)
# Message.destroy_all
# Wall.destroy_all
# Chatroom.destroy_all


# Chatroom.create!(
#   name: "Human lore",
#   password: "",
#   status: "private",
#   language: "english",
#   language_level: "advanced",
#   topic: "history",
#   security_level: ""
# )

# Chatroom.create!(
#   name: "pa comer rico",
#   password: "",
#   status: "public",
#   language: "spanish",
#   language_level: "fluent",
#   topic: "food",
#   security_level: ""
# )

# Chatroom.create!(
#   name: "Foot",
#   password: "",
#   status: "private",
#   language: "french",
#   language_level: "beginner",
#   topic: "sports",
#   security_level: ""
# )

# Chatroom.create!(
#   name: "Viajar com amigos",
#   password: "",
#   status: "private",
#   language: "portuguese",
#   language_level: "medium",
#   topic: "travel",
#   security_level: ""
# )

# Chatroom.create!(
#   name: "Cantare in Napoli",
#   password: "",
#   status: "private",
#   language: "italian",
#   language_level: "advanced",
#   topic: "music",
#   security_level: ""
# )

# Chatroom.find_each do |chatroom|
#   Wall.create!(chatroom_id: chatroom.id)
# end
