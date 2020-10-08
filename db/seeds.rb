require 'faker'
require 'open-uri'

############################# Destroy Chatrooms #############################
Chatroom.destroy_all

############################# Random Pictures UNSPLASH #############################
# TENNIS
tennis_pic = "https://source.unsplash.com/1600x900/?tennis"
# FOOTBALL
football_pic = "https://source.unsplash.com/1600x900/?soccer"
# BASKETBALL
basketball_pic = "https://source.unsplash.com/1600x900/?basketball"
# RUNNING
running_pic = "https://source.unsplash.com/1600x900/?running"
# VOLEYBALL
voleyball_pic = "https://source.unsplash.com/1600x900/?voleyball"
# YOGA
yoga_pic = "https://source.unsplash.com/1600x900/?yoga"

############################# Gender & User Name generator #############################
# Gender generator, with length of 4 characters and choosing Male or Female.
def generate_username(gender)
  name = ""
  while name.length < 4
    if gender == "Male"
      name = Faker::Name.male_first_name
    else
      name = Faker::Name.female_first_name
    end
  end
  name
end

############################# descriptions for "User" table #############################
# Descriptions for the "User" table.
descriptions = []

descriptions << "Level up your skills and practice some sports with me!"
descriptions << "Sport lover!"
descriptions << "I just moved to town and wanna practice sports with other people"
descriptions << "Looking for another people to play around my area!"
descriptions << "Be aware -- I consider myself a challenging partner to do sports LOL!"
descriptions << "Don't hate tha playa hate tha game (that's what I always say)!"
descriptions << "Looking to play with people at my same skill level!"
descriptions << "Love the great outdoors and especially sporting it!"
descriptions << "For me, hitting the cement is the best feeling!"
descriptions << "Hustle bustle sporty bustle - that's me haha!"
descriptions << "Been practicing since I was kid, could always use more practice!"
descriptions << "Coach is my best friend :) "
descriptions << "Nothing like the sound of swish IMO LOL"
descriptions << "Over here to find a regular buddy to sport with."
descriptions << "Always looking for a sport time!"
descriptions << "Never come home when the bell rings"
descriptions << "Momma be callin' askin where I'm at. Always on the court!"
descriptions << "8 on 8 anytime of day"
descriptions << "Rain or shine, I'm on the line!"
descriptions << "LMK if you know someone who enjoys a run"
descriptions << "My favorite shape is ball ;) "
descriptions << "Got Game?"
descriptions << "Sweating it out"
descriptions << "Go LARGE or go HOME"

############################# Destroy database #############################
## Cleaning Database
puts 'Cleaning database...'
Player.destroy_all
p 1
Activity.destroy_all
p 2
SportUser.destroy_all
p 3
Sport.destroy_all
p 4
User.destroy_all
p 5

############################# SPORTS TABLE #############################
## "Sports" table seed
  # Creating Sports
puts 'Creating Sports...'

sports = {}

%w[Basketball Tennis Football Running Volleyball Yoga].each do |name|
  sport = Sport.create!(name: name)
  sports[name.downcase.to_sym] = sport
end

puts 'Sports Created!'

############################# ACTIVITY & PLAYERS & USER TABLE #############################


# ///// ARRAY OF LOCATIONS ////
locations = ["Arlozorov 100, Tel Aviv", "Balfour 200, Herziliya", "Begin 350, Jerusalem",
            "Ben Gurion 380, Rishon", "Bialik 180, Rechovot", "Dizengoff 100, Haifa",
            "Herzl 400, Eilat", "Rabin 580, Ashdod", "Ibn Gabirol 200, Kfar Saba",
            "Ibn Gabirol 250, Tzfat", "Ibn Gabirol 50, Tiveria", "Ibn Gabirol 70, Netanya",
            "Dizengoff 130, Ashkelon", "Dizengoff 500, Bat Yam", "Dizengoff 120, Naharia",
            "Balfour 230, Mitzpe Ramon", "Balfour 100, Efrat", "Balfour 240, Beer Sheva"]



# ///////////// CREATING AN ACTIVITY BY HAND BY ARIEL (FOOTBALL) /////////////



ariel = User.create!(email: 'ariel@ariel.com', password: '123456', gender: 'Male', username: 'ariel')
ariel.photo.attach(io: File.open("app/assets/images/users/ariel.jpg"), filename: "ariel.jpg")
ariel.save

puts "creating ariels_soccer_match"
SportUser.create!(user: ariel, sport: sports[:football], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
ariels_soccer_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * 60),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: ariel,
  sport: sports[:football],
  title: "Friendly 5-on-5 football",
  description: "Come and play soccer with my team!"
)
puts "ariels_soccer_match created"
ariels_soccer_match.add_player(ariel)




schneur = User.create!(email: 'schneur@schneur.com', password: '123456', gender: 'Male', username: 'schneur')
schneur.photo.attach(io: File.open("app/assets/images/users/schneur.jpg"), filename: "schneur.jpg")
schneur.save

puts "creating schneurs_tennis_match"
SportUser.create!(user: schneur, sport: sports[:tennis], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
schneurs_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: schneur,
  sport: sports[:tennis],
  title: "Tennis singles!",
  description: "Come & join. Loser pays the beers! 🍻"
)
puts "schneurs_tennis_match created"
schneurs_tennis_match.add_player(schneur)





naftali = User.create!(email: 'naftali@lewagon.com', password: '123456', gender: 'Male', username: 'naftali')
naftali.photo.attach(io: File.open("app/assets/images/users/naftali.jpg"), filename: "naftali.jpg")
naftali.save

puts "creating naftalis_yoga_session"
SportUser.create!(user: naftali, sport: sports[:yoga], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
naftalis_yoga_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Pro',
  user: naftali,
  sport: sports[:yoga],
  title: "Yoga with Nati",
  description: "Come & relax with nice people!"
)
puts "naftalis_yoga_session created"
naftalis_yoga_session.add_player(naftali)




david = User.create!(email: 'david@david.com', password: '123456', gender: 'Male', username: 'david')
david.photo.attach(io: File.open("app/assets/images/users/david.jpg"), filename: "david.jpg")
david.save

puts "creating davids_basketball_match"
SportUser.create!(user: david, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
davids_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 8,
  location: locations.sample,
  skill_level: 'Pro',
  user: david,
  sport: sports[:basketball],
  title: "Best Israel basketball match!",
  description: "Are you sure you can defeat me and my friends?"
)
puts "davids_basketball_match created"
davids_basketball_match.add_player(david)




vincent = User.create!(email: 'vincent@vincent.com', password: '123456', gender: 'Male', username: 'vincent')
vincent.photo.attach(io: File.open("app/assets/images/users/vincent.jpg"), filename: "vincent.jpg")
vincent.save
puts "creating vincents_running_session"
SportUser.create!(user: vincent, sport: sports[:running], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
vincents_running_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 50,
  location: locations.sample,
  skill_level: 'Beginner',
  user: vincent,
  sport: sports[:running],
  title: "Run Vincent run!",
  description: "I will teach you the best technique for running in hard surfaces!"
)
puts "vincents_running_session created"
vincents_running_session.add_player(vincent)



omer = User.create!(email: 'omer@omer.com', password: '123456', gender: 'Male', username: 'omer')
omer.photo.attach(io: File.open("app/assets/images/users/omer.jpg"), filename: "omer.jpg")
omer.save

puts "creating omers_basketball_match"
SportUser.create!(user: omer, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
omers_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 16,
  location: locations.sample,
  skill_level: 'Pro',
  user: omer,
  sport: sports[:basketball],
  title: "Play with a former pro!",
  description: "Now I like playing for a hobby. Happy if you can join me for a 4-on-4!"
)
puts "omers_basketball_match created"
omers_basketball_match.add_player(omer)




ilan = User.create!(email: 'ilan@ilan.com', password: '123456', gender: 'Male', username: 'ilan')
ilan.photo.attach(io: File.open("app/assets/images/users/ilan.jpg"), filename: "ilan.jpg")
ilan.save

puts "creating ilan_yoga"
SportUser.create!(user: ilan, sport: sports[:yoga], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
ilan_yoga = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Beginner',
  user: ilan,
  sport: sports[:yoga],
  title: "Relax with Ilan!",
  description: "Outdoor Yoga lover, join me!"
)
puts "ilan_yoga created"
ilan_yoga.add_player(ilan)



martin = User.create!(email: 'martin@martin.com', password: '123456', gender: 'Male', username: 'martin')
martin.photo.attach(io: File.open("app/assets/images/users/martin.jpg"), filename: "martin.jpg")
martin.save
puts "creating martins_running_session"
SportUser.create!(user: martin, sport: sports[:running], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
martins_running_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 15,
  location: locations.sample,
  skill_level: 'Pro',
  user: martin,
  sport: sports[:running],
  title: "Run with my team!",
  description: "We wanna prepare for the next marathon!"
)
puts "martins_running_session created"
martins_running_session.add_player(martin)





yair = User.create!(email: 'yair@yair.com', password: '123456', gender: 'Male', username: 'yair')
yair.photo.attach(io: File.open("app/assets/images/users/yair.jpg"), filename: "yair.jpg")
yair.save

puts "creating yairs_basketball_match"
SportUser.create!(user: yair, sport: sports[:basketball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
yairs_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Pro',
  user: yair,
  sport: sports[:basketball],
  title: "Come and try your skills!",
  description: "Prefer practicing Karate... but let's give this sport a try!"
)
puts "yairs_basketball_match created"
yairs_basketball_match.add_player(yair)




Player.create!(activity: davids_basketball_match, user: omer, accepted_at: Time.now)
Player.create!(activity: yairs_basketball_match, user: omer, accepted_at: Time.now)

matan = User.create!(email: 'matan@matan.com', password: '123456', gender: 'Male', username: 'matan')
matan.photo.attach(io: File.open("app/assets/images/users/matan.jpg"), filename: "matan.jpg")
matan.save
puts "creating matan_voleyball_match"
SportUser.create!(user: matan, sport: sports[:volleyball], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
matan_voleyball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 8,
  location: locations.sample,
  skill_level: 'Pro',
  user: matan,
  sport: sports[:volleyball],
  title: "Pro volleyball match!",
  description: "Come and join our weekly match"
)
puts "matan_voleyball_match created"
matan_voleyball_match.add_player(matan)



ran = User.create!(email: 'ran@ran.com', password: '123456', gender: 'Male', username: 'ran')
ran.photo.attach(io: File.open("app/assets/images/users/ran.jpg"), filename: "ran.jpg")
ran.save
puts "creating rans_running_session"
SportUser.create!(user: ran, sport: sports[:running], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
rans_running_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 15,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: ran,
  sport: sports[:running],
  title: "Run challenge!",
  description: "We wanna cross 6K!"
)
puts "rans_running_session created"
rans_running_session.add_player(ran)


isaac = User.create!(email: 'isaac@isaac.com', password: '123456', gender: 'Male', username: 'isaac')
isaac.photo.attach(io: File.open("app/assets/images/users/isaac.jpg"), filename: "isaac.jpg")
isaac.save
puts "creating isaac_tennis_match"
SportUser.create!(user: isaac, sport: sports[:tennis], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
isaac_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 2,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: isaac,
  sport: sports[:tennis],
  title: "Tennis partner nearby?",
  description: "Wanna play with new people around."
)
puts "isaac_tennis_match created"
isaac_tennis_match.add_player(isaac)





eitan = User.create!(email: 'eitan@eitan.com', password: '123456', gender: 'Male', username: 'eitan')
eitan.photo.attach(io: File.open("app/assets/images/users/eitan.jpg"), filename: "eitan.jpg")
eitan.save
puts "creating eitan_voleyball_match"
SportUser.create!(user: eitan, sport: sports[:volleyball], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
eitan_voleyball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: eitan,
  sport: sports[:volleyball],
  title: "Volley dream team game!",
  description: "5 vs 5 volley match with pro players"
)
puts "eitan_voleyball_match created"
eitan_voleyball_match.add_player(eitan)


leo = User.create!(email: 'leo@leo.com', password: '123456', gender: 'Male', username: 'leo')
leo.photo.attach(io: File.open("app/assets/images/users/leo.jpg"), filename: "leo.jpg")
leo.save
puts "creating leos_running_session"
SportUser.create!(user: leo, sport: sports[:running], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
leos_running_session = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 20,
  location: locations.sample,
  skill_level: 'Pro',
  user: leo,
  sport: sports[:running],
  title: "New running skills!",
  description: "In this session our goal is 10km!"
)
puts "leos_running_session created"
leos_running_session.add_player(leo)




uriel = User.create!(email: 'uriel@uriel.com', password: '123456', gender: 'Male', username: 'uriel')
uriel.photo.attach(io: File.open("app/assets/images/users/uriel.jpg"), filename: "uriel.jpg")
uriel.save
puts "creating uriel_yoga"
SportUser.create!(user: uriel, sport: sports[:yoga], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
uriel_yoga = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 5,
  location: locations.sample,
  skill_level: 'Pro',
  user: uriel,
  sport: sports[:yoga],
  title: "Learned Yoga in India!",
  description: "I know the latest techniques!"
)
puts "uriel_yoga created"
uriel_yoga.add_player(uriel)




lucas = User.create!(email: 'lucas@lucas.com', password: '123456', gender: 'Male', username: 'lucas')
lucas.photo.attach(io: File.open("app/assets/images/users/lucas.jpg"), filename: "lucas.jpg")
lucas.save
puts "creating lucas_voleyball_match"
SportUser.create!(user: lucas, sport: sports[:football], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
lucas_football_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 21,
  location: locations.sample,
  skill_level: 'Pro',
  user: lucas,
  sport: sports[:football],
  title: "11 vs 11 game!",
  description: "Play like a professional. Join us!"
)
puts "lucas_voleyball_match created"
lucas_football_match.add_player(lucas)





gaby = User.create!(email: 'gaby@gaby.com', password: '123456', gender: 'Male', username: 'gaby')
gaby.photo.attach(io: File.open("app/assets/images/users/gaby.jpg"), filename: "gaby.jpg")
gaby.save
puts "creating gaby_football_match"
SportUser.create!(user: gaby, sport: sports[:football], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
gaby_football_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Beginner',
  user: gaby,
  sport: sports[:football],
  title: "2 vs 2 indoor soccer",
  description: "Show us your skill in this match."
)
puts "gaby_football_match created"
gaby_football_match.add_player(gaby)



tomer = User.create!(email: 'tomer@tomer.com', password: '123456', gender: 'Male', username: 'tomer')
tomer.photo.attach(io: File.open("app/assets/images/users/tomer.jpg"), filename: "tomer.jpg")
tomer.save
puts "creating tomer_yoga"
SportUser.create!(user: tomer, sport: sports[:yoga], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
tomer_yoga = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: tomer,
  sport: sports[:yoga],
  title: "Yoga partners nearby?",
  description: "Yoga & chilling with new friends"
)
puts "tomer_yoga created"
tomer_yoga.add_player(tomer)




natan = User.create!(email: 'natan@natan.com', password: '123456', gender: 'Male', username: 'natan')
natan.photo.attach(io: File.open("app/assets/images/users/natan.jpg"), filename: "natan.jpg")
natan.save
puts "creating natan_tennis_match"
SportUser.create!(user: natan, sport: sports[:tennis], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
natan_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Beginner',
  user: natan,
  sport: sports[:tennis],
  title: "Can someone teach me tennis?",
  description: "Wanna learn tennis. SOS!"
)
puts "natan_tennis_match created"
natan_tennis_match.add_player(natan)





amos = User.create!(email: 'amos@amos.com', password: '123456', gender: 'Male', username: 'amos')
amos.photo.attach(io: File.open("app/assets/images/users/amos.jpg"), filename: "amos.jpg")
amos.save
puts "creating amos_football_match"
SportUser.create!(user: amos, sport: sports[:football], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
amos_football_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 6,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: amos,
  sport: sports[:football],
  title: "3 vs 3 new style soccer",
  description: "Play this fun sport with me!."
)
puts "amos_football_match created"
amos_football_match.add_player(amos)



tal = User.create!(email: 'tal@tal.com', password: '123456', gender: 'Male', username: 'tal')
tal.photo.attach(io: File.open("app/assets/images/users/tal.jpg"), filename: "tal.jpg")
tal.save
puts "creating tal_voleyball_match"
SportUser.create!(user: tal, sport: sports[:volleyball], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
tal_voleyball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Beginner',
  user: tal,
  sport: sports[:volleyball],
  title: "Best volley training course!",
  description: "Join us in our intensive training course"
)
puts "tal_voleyball_match created"
tal_voleyball_match.add_player(tal)





alan = User.create!(email: 'alan@alan.com', password: '123456', gender: 'Male', username: 'alan')
alan.photo.attach(io: File.open("app/assets/images/users/alan.jpg"), filename: "alan.jpg")
alan.save
puts "creating alan_tennis_match"
SportUser.create!(user: alan, sport: sports[:tennis], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
alan_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Pro',
  user: alan,
  sport: sports[:tennis],
  title: "Doubles game is here!",
  description: "Having fun is our goal!"
)
puts "alan_tennis_match created"
alan_tennis_match.add_player(alan)





elias = User.create!(email: 'elias@elias.com', password: '123456', gender: 'Male', username: 'elias')
elias.photo.attach(io: File.open("app/assets/images/users/elias.jpg"), filename: "elias.jpg")
elias.save
puts "creating elias_basketball_match"
SportUser.create!(user: elias, sport: sports[:basketball], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
elias_basketball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Beginner',
  user: elias,
  sport: sports[:basketball],
  title: "Wanna exercise?",
  description: "I wanna run a bit. Join me!"
)
puts "elias_basketball_match created"
elias_basketball_match.add_player(elias)





daniel = User.create!(email: 'daniel@daniel.com', password: '123456', gender: 'Male', username: 'daniel')
daniel.photo.attach(io: File.open("app/assets/images/users/daniel.jpg"), filename: "daniel.jpg")
daniel.save
puts "creating daniel_football_match"
SportUser.create!(user: daniel, sport: sports[:football], skill_level: 'Beginner')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
daniel_football_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 21,
  location: locations.sample,
  skill_level: 'Beginner',
  user: daniel,
  sport: sports[:football],
  title: "Football game",
  description: "After the match we are going for beers!"
)
puts "daniel_football_match created"
daniel_football_match.add_player(daniel)





rafael = User.create!(email: 'rafael@rafael.com', password: '123456', gender: 'Male', username: 'rafael')
rafael.photo.attach(io: File.open("app/assets/images/users/rafael.jpg"), filename: "rafael.jpg")
rafael.save
puts "creating rafael_tennis_match"
SportUser.create!(user: rafael, sport: sports[:tennis], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
rafael_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 6,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: rafael,
  sport: sports[:tennis],
  title: "Tennis tournament",
  description: "We have 3 excellents courts. Join!"
)
puts "rafael_tennis_match created"
rafael_tennis_match.add_player(rafael)



james = User.create!(email: 'james@james.com', password: '123456', gender: 'Male', username: 'james')
james.photo.attach(io: File.open("app/assets/images/users/james.jpg"), filename: "james.jpg")
james.save
puts "creating james_voleyball_match"
SportUser.create!(user: james, sport: sports[:volleyball], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
james_voleyball_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 6,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: james,
  sport: sports[:volleyball],
  title: "Come and train volleyball!",
  description: "If you wanna train volley this is the place"
)
puts "james_voleyball_match created"
james_voleyball_match.add_player(james)




kevin = User.create!(email: 'kevin@kevin.com', password: '123456', gender: 'Male', username: 'kevin')
kevin.photo.attach(io: File.open("app/assets/images/users/kevin.jpg"), filename: "kevin.jpg")
kevin.save
puts "creating kevin_football_match"
SportUser.create!(user: kevin, sport: sports[:football], skill_level: 'Intermediate')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
kevin_football_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 10,
  location: locations.sample,
  skill_level: 'Intermediate',
  user: kevin,
  sport: sports[:football],
  title: "5 vs 5 indoor!",
  description: "Some of us used to play for the national team"
)
puts "kevin_football_match created"
kevin_football_match.add_player(kevin)





joel = User.create!(email: 'joel@joel.com', password: '123456', gender: 'Male', username: 'joel')
joel.photo.attach(io: File.open("app/assets/images/users/joel.jpg"), filename: "joel.jpg")
joel.save
puts "creating joel_tennis_match"
SportUser.create!(user: joel, sport: sports[:tennis], skill_level: 'Pro')
start_time = Time.now + (60 * 60 * 24 * rand(1..7))
joel_tennis_match = Activity.create!(
  start_time: start_time,
  end_time: start_time + (60 * rand(60..90)),
  player_limit: 4,
  location: locations.sample,
  skill_level: 'Pro',
  user: joel,
  sport: sports[:tennis],
  title: "Double tennis match",
  description: "Love doubles. Much more fun!"
)
puts "joel_tennis_match created"
joel_tennis_match.add_player(joel)









# ///// ARRAY OF EVENTS OR ACTIVITIES ////

activities_to_do = [ariels_soccer_match, schneurs_tennis_match,
                    naftalis_yoga_session, vincents_running_session, omers_basketball_match,
                    davids_basketball_match, yairs_basketball_match, matan_voleyball_match, tal_voleyball_match,
                    james_voleyball_match, eitan_voleyball_match, ilan_yoga, uriel_yoga, tomer_yoga, lucas_football_match,
                    gaby_football_match, amos_football_match, daniel_football_match, elias_basketball_match, isaac_tennis_match,
                    joel_tennis_match, natan_tennis_match, rafael_tennis_match, alan_tennis_match, kevin_football_match, martins_running_session,
                    rans_running_session, leos_running_session]

# /////////////////////////////////// ITERATE JOINING GAME SOCCER-INTERMIDATE ///////////////////////////////////

puts "Creating Male Players(game joiners) & Users(game host) for the game.....SOCCER-INTERMIDATE"

search_results_man_1 = Unsplash::Photo.search("man face").take(5)
5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_1[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game.....SOCCER-INTERMIDATE"
search_results_female_1 = Unsplash::Photo.search("female face").take(3)
3.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_female_1[i].urls.small)
  user.photo.attach(io: file, filename: "female-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Intermediate')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME TENNIS-INTERMIDATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game..... TENNIS-INTERMIDATE"

search_results_man_2 = Unsplash::Photo.search("man face").take(3)

3.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_2[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game..... TENNIS-INTERMIDATE"
search_results_female_2 = Unsplash::Photo.search("female face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_female_2[i].urls.small)
  user.photo.attach(io: file, filename: "female-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME YOGA-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game..... YOGA-PRO"
search_results_man_3 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_3[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Pro')
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
  end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game..... YOGA-PRO"
search_results_female_3 = Unsplash::Photo.search("female face").take(2)
2.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_female_3[i].urls.small)
  user.photo.attach(io: file, filename: "female-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Pro')
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
    choosen_match = activities_to_do.sample
    while choosen_match.player_limit <= choosen_match.players.count
      choosen_match = activities_to_do.sample
    end
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME RUNNING-BEGGINER ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUNNING-BEGGINER"
search_results_man_4 = Unsplash::Photo.search("man face").take(5)
5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Creating Female Players(game joiners) & Users(game host) for the game.....RUNNING-BEGGINER"
search_results_female_4 = Unsplash::Photo.search("female face").take(5)
5.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Female', username: Faker::Name.female_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_female_4[i].urls.small)
  user.photo.attach(io: file, filename: "female-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Beginner')
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)

  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME YOGA-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME TENNIS-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....TENNIS-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME RUNNING-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUNNING-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME RUNNING-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUNNING-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME RUNNING-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUNNING-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME VOLLEYBALL-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....VOLLEYBALL-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:volleyball], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME TENNIS-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....TENNIS-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME TENNIS-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....TENNIS-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:tennis], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME VOLLEYBALL-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....VOLLEYBALL-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:volleyball], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME FOOTBALL-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....FOOTBALL-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME YOGA-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME YOGA-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end



# /////////////////////////////////// ITERATE JOINING GAME RUN-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....RUN-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:running], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME BASKETBALL-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....BASKETBALL-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME BASKETBALL-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....BASKETBALL-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME BASKETBALL-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....BASKETBALL-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:basketball], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME FOOTBALL-PRO ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....FOOTBALL-PRO "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:football], skill_level: 'Pro')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end

# /////////////////////////////////// ITERATE JOINING GAME YOGA-BEGINNER ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-BEGINNER "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME YOGA-BEGINNER ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-BEGINNER "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Beginner')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


# /////////////////////////////////// ITERATE JOINING GAME YOGA-INTERMEDIATE ///////////////////////////////////
puts "Creating Male Players(game joiners) & Users(game host) for the game.....YOGA-INTERMEDIATE "
search_results_man_4 = Unsplash::Photo.search("man face").take(4)
4.times do |i|
  user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  while !user.save
    user = User.new(email: Faker::Internet.email, password: '123456', gender: 'Male', username: Faker::Name.male_first_name, description: descriptions.shuffle.last)
  end
  file = URI.open(search_results_man_4[i].urls.small)
  user.photo.attach(io: file, filename: "male-#{i}.png", content_type: 'image/png')
  user.save
  SportUser.create!(user: user, sport: sports[:yoga], skill_level: 'Intermediate')
  choosen_match = activities_to_do.sample
  counter = 0
  while choosen_match.player_limit <= choosen_match.players.count
    choosen_match = activities_to_do.sample
    break if counter == 10
    counter += 1
  end
  break if counter == 10
  Player.create!(activity: choosen_match, user: user, accepted_at: Time.now)
  puts "Player #{user.username} created"
end


puts "Connecting Chatrooms"
Chatroom.connect_all_chatrooms

