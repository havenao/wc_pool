# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Share.destroy_all
Result.destroy_all
Team.destroy_all
Player.destroy_all

teams = [
  {name: "Qatar", points: 0, group: "A"},
  {name: "Ecuador", points: 0, group: "A"},
  {name: "Senegal", points: 0, group: "A"},
  {name: "Netherlands", points: 0, group: "A"},
  {name: "England", points: 0, group: "B"},
  {name: "Iran", points: 0, group: "B"},
  {name: "United States", points: 0, group: "B"},
  {name: "Wales", points: 0, group: "B"},
  {name: "Argentina", points: 0, group: "C"},
  {name: "Saudi Arabia", points: 0, group: "C"},
  {name: "Mexico", points: 0, group: "C"},
  {name: "Poland", points: 0, group: "C"},
  {name: "France", points: 0, group: "D"},
  {name: "Australia", points: 0, group: "D"},
  {name: "Denmark", points: 0, group: "D"},
  {name: "Tunisia", points: 0, group: "D"},
  {name: "Spain", points: 0, group: "E"},
  {name: "Costa Rica", points: 0, group: "E"},
  {name: "Germany", points: 0, group: "E"},
  {name: "Japan", points: 0, group: "E"},
  {name: "Belgium", points: 0, group: "F"},
  {name: "Canada", points: 0, group: "F"},
  {name: "Morocco", points: 0, group: "F"},
  {name: "Croatia", points: 0, group: "F"},
  {name: "Brazil", points: 0, group: "G"},
  {name: "Serbia", points: 0, group: "G"},
  {name: "Switzerland", points: 0, group: "G"},
  {name: "Cameroon", points: 0, group: "G"},
  {name: "Portugal", points: 0, group: "H"},
  {name: "Ghana", points: 0, group: "H"},
  {name: "Uruguay", points: 0, group: "H"},
  {name: "South Korea", points: 0, group: "H"},
]

players = [
  {name: "Alex", points: 0},
  {name: "Andre", points: 0},
  {name: "Andy", points: 0},
  {name: "Atlee", points: 0},
  {name: "Beth", points: 0},
  {name: "Dagan", points: 0},
  {name: "Haven", points: 0},
  {name: "Isaac", points: 0},
  {name: "JSB", points: 0},
  {name: "Katie", points: 0},
  {name: "Loewen", points: 0},
  {name: "Ned", points: 0},
]

Team.create(teams)
puts "Added all teams."
Player.create(players)
puts "Added all players."

def player_id(name)
  Player.where(name: name).id
end

def team_id(name)
  Team.where(name: name).id
end

alex = [
  {player_id: player_id("Alex"), team_id: team_id("France"), amount: 30, points: 0},
  {player_id: player_id("Alex"), team_id: team_id("Argentina"), amount: 20, points: 0},
  {player_id: player_id("Alex"), team_id: team_id("Netherlands"), amount: 20, points: 0},
  {player_id: player_id("Alex"), team_id: team_id("Spain"), amount: 10, points: 0},
  {player_id: player_id("Alex"), team_id: team_id("Portugal"), amount: 10, points: 0},
]

andre = [
  {player_id: player_id("Andre"), team_id: team_id("Argentina"), amount: 40, points: 0},
  {player_id: player_id("Andre"), team_id: team_id("France"), amount: 20, points: 0},
  {player_id: player_id("Andre"), team_id: team_id("England"), amount: 10, points: 0},
  {player_id: player_id("Andre"), team_id: team_id("Brazil"), amount: 10, points: 0},
  {player_id: player_id("Andre"), team_id: team_id("Uruguay"), amount: 10, points: 0},
  {player_id: player_id("Andre"), team_id: team_id("Mexico"), amount: 10, points: 0},
]

andy = [
  {player_id: player_id("Andy"), team_id: team_id("Croatia"), amount: 30, points: 0},
  {player_id: player_id("Andy"), team_id: team_id("Brazil"), amount: 20, points: 0},
  {player_id: player_id("Andy"), team_id: team_id("Spain"), amount: 20, points: 0},
  {player_id: player_id("Andy"), team_id: team_id("Netherlands"), amount: 10, points: 0},
  {player_id: player_id("Andy"), team_id: team_id("Wales"), amount: 10, points: 0},
  {player_id: player_id("Andy"), team_id: team_id("Japan"), amount: 10, points: 0},
]

atlee = [
  {player_id: player_id("Atlee"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Atlee"), team_id: team_id("Argentina"), amount: 20, points: 0},
  {player_id: player_id("Atlee"), team_id: team_id("France"), amount: 20, points: 0},
  {player_id: player_id("Atlee"), team_id: team_id("England"), amount: 10, points: 0},
  {player_id: player_id("Atlee"), team_id: team_id("Spain"), amount: 10, points: 0},
  {player_id: player_id("Atlee"), team_id: team_id("Germany"), amount: 10, points: 0},
]

beth = [
  {player_id: player_id("Beth"), team_id: team_id("Argentina"), amount: 30, points: 0},
  {player_id: player_id("Beth"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Beth"), team_id: team_id("France"), amount: 20, points: 0},
  {player_id: player_id("Beth"), team_id: team_id("Uruguay"), amount: 20, points: 0},
]

dagan = [
  {player_id: player_id("Dagan"), team_id: team_id("Belgium"), amount: 30, points: 0},
  {player_id: player_id("Dagan"), team_id: team_id("Denmark"), amount: 30, points: 0},
  {player_id: player_id("Dagan"), team_id: team_id("Uruguay"), amount: 20, points: 0},
  {player_id: player_id("Dagan"), team_id: team_id("Argentina"), amount: 10, points: 0},
  {player_id: player_id("Dagan"), team_id: team_id("Brazil"), amount: 10, points: 0},
]

haven = [
  {player_id: player_id("Haven"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Haven"), team_id: team_id("Netherlands"), amount: 30, points: 0},
  {player_id: player_id("Haven"), team_id: team_id("Argentina"), amount: 20, points: 0},
  {player_id: player_id("Haven"), team_id: team_id("France"), amount: 20, points: 0},
]

isaac = [
  {player_id: player_id("Isaac"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Isaac"), team_id: team_id("Argentina"), amount: 20, points: 0},
  {player_id: player_id("Isaac"), team_id: team_id("Germany"), amount: 20, points: 0},
  {player_id: player_id("Isaac"), team_id: team_id("England"), amount: 10, points: 0},
  {player_id: player_id("Isaac"), team_id: team_id("France"), amount: 10, points: 0},
  {player_id: player_id("Isaac"), team_id: team_id("Netherlands"), amount: 10, points: 0},
]

jsb = [
  {player_id: player_id("JSB"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("JSB"), team_id: team_id("England"), amount: 20, points: 0},
  {player_id: player_id("JSB"), team_id: team_id("France"), amount: 20, points: 0},
  {player_id: player_id("JSB"), team_id: team_id("Wales"), amount: 10, points: 0},
  {player_id: player_id("JSB"), team_id: team_id("Spain"), amount: 10, points: 0},
]

katie = [
  {player_id: player_id("Katie"), team_id: team_id("Argentina"), amount: 50, points: 0},
  {player_id: player_id("Katie"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Katie"), team_id: team_id("Netherlands"), amount: 20, points: 0},
]

loewen = [
  {player_id: player_id("Loewen"), team_id: team_id("Argentina"), amount: 50, points: 0},
  {player_id: player_id("Loewen"), team_id: team_id("Spain"), amount: 50, points: 0},
]

ned = [
  {player_id: player_id("Ned"), team_id: team_id("Brazil"), amount: 30, points: 0},
  {player_id: player_id("Ned"), team_id: team_id("Germany"), amount: 30, points: 0},
  {player_id: player_id("Ned"), team_id: team_id("Netherlands"), amount: 20, points: 0},
  {player_id: player_id("Ned"), team_id: team_id("Canada"), amount: 10, points: 0},
  {player_id: player_id("Ned"), team_id: team_id("Iran"), amount: 10, points: 0},
]

shares = alex + andre + andy + atlee + beth + dagan + haven + isaac + jsb + katie + loewen + ned
Shares.create(shares)

puts "Added all shares."