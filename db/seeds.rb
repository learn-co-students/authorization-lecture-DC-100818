# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Museum.destroy_all
Oddity.destroy_all
User.destroy_all

shack = Museum.create(name: "Mystery Shack", location: "Gravity Falls, OR")
crypt = Museum.create(name: "Cryptonomica", location: "Kepler, WV")


paw = Oddity.create(name: "Monkey's Paw", description: "A cursed voodoo item, said to grant wishes at a horrible cost.", actual_description: "Bits of rope and newspaper in the rough shape of a clenched fist. Myriad hair glued about.", museum: shack)

mermaid = Oddity.create(name: "The Mermaid", description: "The skeleton of a mermaid found by divers off the coast of Barbados. Roughly the size of a carp, the skelton features a long, fishlike tail and a humanoid torso.", actual_description: "Turns out someone attached a cat skeleton to a fish skeleton. Gross.", museum: shack)

fur = Oddity.create(name: "Big Foot fur", description: "A clump of Sasquach hair, still stuck on the branch it was found in.", actual_description: "Some hair on a stick.", museum: crypt)


user1 = User.create(username: "chuck", password: "pw", name: "Chuck Vanderbuilt", hometown: "Trapper's Pit, WV", favorite_cryptid: "The Big Foot")
user2 = User.create(username: "hugo", password: "pw", name: "Hugo Ferenz", hometown: "Ho-ho-kus, NJ", favorite_cryptid: "Mothman")
user3 = User.create(username: "cam", password: "pw", name: "Cam McDonald", hometown: "Sascatuwanna, MI", favorite_cryptid: "Jesus")


VisitorOddity.create(user: user1, oddity: fur)
VisitorOddity.create(user: user1, oddity: paw)

VisitorOddity.create(user: user2, oddity: paw)
VisitorOddity.create(user: user2, oddity: mermaid)

VisitorOddity.create(user: user3, oddity: fur)
