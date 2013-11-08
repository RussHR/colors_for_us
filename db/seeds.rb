# Users

ned = User.create!(email: "ned@example.com", password: "ilovecats")
kush = User.create!(email: "kush@example.com", password: "ilovecats")
flarnie = User.create!(email: "flarnie@example.com", password: "ilovecats")
asher = User.create!(email: "asher@example.com", password: "ilovecats")
cj = User.create!(email: "cj@example.com", password: "ilovecats")
dylan = User.create!(email: "dylan@example.com", password: "ilovecats")

# Palettes

ned.palettes.create!(name: "The Warmest Passion", color_1: "#414437",
                       color_2: "#E5A38A", color_3: "#A28A6A",
                       color_4: "#636B62")
ned.palettes.create!(name: "Giant Goldfish", color_1: "#69D2E7",
                       color_2: "#A7DBD8", color_3: "#E0E4CC",
                       color_4: "#F38630", color_5: "#FA6900")
kush.palettes.create!(name: "Thought Provoking", color_1: "#ECD078",
                       color_2: "#D95B43", color_3: "#C02942",
                       color_4: "#542437", color_5: "#53777A")
flarnie.palettes.create!(name: "Something!", color_1: "#FE4365",
                         color_2: "#FC9D9A", color_3: "#F9CDAD",
                         color_4: "#C8C8A9", color_5: "#83AF9B")
flarnie.palettes.create!(name: "cheer up emo kid", color_1: "#C44D58",
                         color_2: "#4ECDC4", color_3: "#C7F464",
                         color_4: "#FF6B6B")
flarnie.palettes.create!(name: "Adrift in Dreams", color_1: "#CFF09E",
                         color_2: "#A8DBA8", color_3: "#79BD9A",
                         color_4: "#3B8686", color_5: "#0B486B")
asher.palettes.create!(name: "let them eat cake", color_1: "#ECE5CE",
                       color_2: "#E08E79", color_3: "#F1D4AF")
cj.palettes.create!(name: "Something else!", color_1: "#490A3D")
cj.palettes.create!(name: "Terra?", color_1: "#E8DDCB", color_2: "#CDB380")
dylan.palettes.create!(name: "melon ball surprise", color_1: "#D1F2A5",
                       color_2: "#EFFAB4", color_3: "#FFC48C",
                       color_4: "#FF9F80", color_5: "#F56991")
dylan.palettes.create!(name: "Good Friends", color_1: "#D9CEB2",
                       color_2: "#948C75", color_3: "#D5DED9",
                       color_4: "#7A6A53", color_5: "#99B2B7")
dylan.palettes.create!(name: "LoversInJapan", color_1: "#E94E77",
                       color_2: "#D68189", color_3: "#C6A49A",
                       color_4: "#C6E5D9", color_5: "#F4EAD5")
                       
# Favorites

ned.favorites.create!(palette_id: 1)