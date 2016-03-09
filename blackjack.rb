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
        "H" => [5, 6, 7, 8, 12],
        "Dh"=> [9, 10, 11],
        "S" => [13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    3 => {
        "H" => [5, 6, 7, 8, 12],
        "Dh"=> [9, 10, 11],
        "S" => [13, 14, 15, 16, 17, 18, 19, 20, 21]
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
        "S" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    7 => {
        "H" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Dh"=> [10, 11],
        "S" => [17, 18, 19, 20, 21]
    },
    8 => {
        "H" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Dh"=> [10, 11],
        "S" => [17, 18, 19, 20, 21]
    },
    9 => {
        "H" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Dh"=> [10, 11],
        "S" => [17, 18, 19, 20, 21]
    },
    10 => {
        "H" => [5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16],
        "Dh"=> [11],
        "S" => [17, 18, 19, 20, 21]
    },
    "A" => {
        "H" => [5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16],
        "Dh"=> [11],
        "S" => [17, 18, 19, 20, 21]
    }
}

soft = {
    # dealer card =>
    2 => {
        "H" => [13, 14, 15, 16],
        "Dh"=> [17],
        "S" => [18, 19, 20, 21]
    },
    3 => {
        "H" => [13, 14, 15, 16],
        "Dh"=> [17],
        "Ds" => [18],
        "S" => [19, 20, 21]
    },
    4 => {
        "Dh"=> [13, 14, 15, 16, 17],
        "Ds" => [18],
        "S" => [19, 20, 21]
    },
    5 => {
        "Dh"=> [13, 14, 15, 16, 17],
        "Ds" => [18],
        "S" => [19, 20, 21]
    },
    6 => {
        "Dh"=> [13, 14, 15, 16, 17],
        "Ds" => [18, 19],
        "S" => [20, 21]
    },
    7 => {
        "H" => [13, 14, 15, 16, 17],
        "S" => [18, 19, 20, 21]
    },
    8 => {
        "H" => [13, 14, 15, 16, 17],
        "S" => [18, 19, 20, 21]
    },
    9 => {
        "H" => [13, 14, 15, 16, 17, 18],
        "S" => [19, 20, 21]
    },
    10 => {
        "H" => [13, 14, 15, 16, 17, 18],
        "S" => [19, 20, 21]
    },
    "A" => {
        "H" => [13, 14, 15, 16, 17],
        "S" => [18, 19, 20, 21]
    }
}
