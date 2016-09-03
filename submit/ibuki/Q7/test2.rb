card = []

mk = ["Spade", "Heart", "Dia", "Club"]

num = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q" ,"K"]




for i in(0..3)

  for k in(0..12)

    card << mk[i] + num[k].to_s

  end

end

puts card



puts "[test]"

p card.sample
