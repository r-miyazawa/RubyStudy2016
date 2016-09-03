class Card
mk=0
num=0
ca = Array.new()
mk = ["Spade", "Heart", "Dia", "Club"]
 
num = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q" ,"K"]
 
for i in(0..3)

for k in(0..12)
ca << mk[i] + num[k].to_s
end

end

p ca[rand(0..51)] 
end

card=Card.new()

