def first_card
    puts "Enter your first card:"

    input = gets.upcase.chomp

    if input == "J" || input == "K" || input == "Q"
        input = 10
        return input
    else
        return input
    end
end

def second_card
    puts "Enter your second card:"

    input = gets.upcase.chomp

    if input == "J" || input == "K" || input == "Q"
        input = 10
        return input
    else
        return input
    end
end

def dealer_card
    puts "Enter the dealer's card:"

    input = gets.upcase.chomp

    if input == "J" || input == "K" || input == "Q"
        input = 10
        return input
    else
        return input
    end
end

#-----------------

first = first_card
second = second_card
dealer = dealer_card

puts "First card: #{first}\nSecond card: #{second}\nDealer card: #{dealer}"
cardset = first.to_i + second.to_i
puts "Cardset: #{cardset}"

hard = {
    # dealer card =>
    2 => {
        # player card => option
        5..8 => "H",
        9..11 => "Dh",
        12 => "H",
        13..21 => "S"

    },
    3 => {
        5  => "H",
        6 => "H",
        7 => "H",
        8 => "H",
        9 => "Dh",
        10 => "Dh",
        11 => "Dh",
        12 => "S",
        13 => "S",
        14 => "S",
        15 => "S",
        16 => "S",
        17 => "S",
        18 => "S",
        19 => "S",
        20 => "S",
        21 => "S"
    },
    4 => {
        "H" => [5, 6, 7, 8],
        "Dh"=> [9, 10, 11],
        "S" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    5 => {
        "H" => [5, 6, 7],
        "Dh" => [8, 9, 10, 11],
        "S" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    },
    6 => {
        "H" => [5, 6, 7],
        "Dh" => [8, 9, 10, 11],
        "S" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    }
    # 7
    # 8
    # 9
    # 10
    # "A"

}
