# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

puts "🧹 Nettoyage de la base..."
Donation.destroy_all
User.destroy_all

# ══════════════════════════════════════
# USERS
# ══════════════════════════════════════
puts "👤 Création des utilisateurs..."

users = [
  { email: "marie@hunt.com" },
  { email: "thomas@hunt.com" },
  { email: "sophie@hunt.com" },
  { email: "romain@hunt.com" },
  { email: "lucie@hunt.com" },
  { email: "alice@hunt.com" },
]

created_users = users.map do |u|
  User.create!(
    email:    u[:email],
    password: "password123"
  )
end

puts "  ✅ #{created_users.count} utilisateurs créés"

# ══════════════════════════════════════
# DONATIONS
# ══════════════════════════════════════
puts "📦 Création des objets..."

items_data = [
  {
    name:         "Chaise de bureau ergonomique",
    description:  "Chaise réglable en hauteur, accoudoirs ajustables. Utilisée 2 ans, toujours en parfait état. Marque Ikea.",
    category:     "furniture",
    condition:    "very_good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[0]
  },
  {
    name:         "Lot de 8 romans policiers",
    description:  "8 romans en très bon état. Auteurs : Maxime Chattam, Franck Thilliez, Jean-Christophe Grangé. Idéal pour les amateurs de suspense.",
    category:     "books",
    condition:    "good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[1]
  },
  {
    name:         "Jouets enfants 2–5 ans",
    description:  "Grande boîte de jouets : puzzles, jeux de construction, peluches. Lavés et désinfectés. Mes enfants ont grandi !",
    category:     "toys",
    condition:    "very_good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[2]
  },
  {
    name:         "Écran PC 24\" Dell IPS",
    description:  "Écran Dell 24 pouces full HD, dalle IPS, pivot 90°. Fonctionne parfaitement, vendu car upgrade vers 27 pouces.",
    category:     "electronics",
    condition:    "good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[3]
  },
  {
    name:         "Plantes d'intérieur — lot de 4",
    description:  "4 plantes en bonne santé : pothos, monstera, cactus, ficus. Pots inclus. Idéal pour débuter en jardinage d'intérieur.",
    category:     "garden",
    condition:    "new",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[4]
  },
  {
    name:         "Robot pâtissier KitchenAid",
    description:  "Robot pâtissier KitchenAid coloris rouge, livré avec les accessoires d'origine. Rarement utilisé, excellent état.",
    category:     "kitchen",
    condition:    "very_good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[5]
  },
  {
    name:         "Vélo enfant 20 pouces",
    description:  "Vélo pour enfant de 6 à 9 ans, avec stabilisateurs amovibles. Quelques égratignures mais fonctionne parfaitement.",
    category:     "sports",
    condition:    "good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[0]
  },
  {
    name:         "Table basse en bois massif",
    description:  "Table basse en chêne massif, style scandinave. 120x60 cm. Très bon état, vendue car déménagement.",
    category:     "furniture",
    condition:    "very_good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[1]
  },
  {
    name:         "Perceuse Bosch sans fil",
    description:  "Perceuse visseuse Bosch 18V avec 2 batteries et chargeur. Livrée dans sa mallette d'origine. Très peu utilisée.",
    category:     "tools",
    condition:    "very_good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[2]
  },
  {
    name:         "Vêtements bébé 0–6 mois",
    description:  "Lot de 20 pièces : bodys, pyjamas, chaussettes. Très bon état, lavés. Convient fille ou garçon (coloris neutres).",
    category:     "clothes",
    condition:    "good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[3]
  },
  {
    name:         "Toiles et peintures acryliques",
    description:  "Lot de 10 toiles vierges 30x40 cm + tubes de peinture acrylique. Matériel de qualité, à peine entamé.",
    category:     "art",
    condition:    "new",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[4]
  },
  {
    name:         "Micro-ondes Whirlpool",
    description:  "Micro-ondes 800W, 25L, en parfait état de fonctionnement. Remplacé par un modèle combiné. Nettoyé et prêt à partir.",
    category:     "kitchen",
    condition:    "good",
    availability: "available",
    address:      "Dijon, France",
    user:         created_users[5]
  },
]

items_data.each do |data|
  Donation.create!(
    name:         data[:name],
    description:  data[:description],
    category:     data[:category],
    condition:    data[:condition],
    availability: data[:availability],
    address:      data[:address],
    user:         data[:user]
  )
end

puts "  ✅ #{Donation.count} objets créés"

# ══════════════════════════════════════
# RÉSUMÉ
# ══════════════════════════════════════
puts ""
puts "🎉 Seeds terminés !"
puts "   #{User.count} utilisateurs"
puts "   #{Donation.count} objets"
puts ""
puts "🔑 Connexion de test :"
puts "   Email    : marie@hunt.com"
puts "   Password : password123"
