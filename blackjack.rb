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

# Blackjack Strategy:
#     H -- Hit
#     S -- Stand
#     P -- Split
#    Dh -- Double if possible, otherwise hit
#    Ds -- Double if possible, otherwise stand

hard_hand = {
    # Dealer card =>
    2 => {
        # Suggestion => Player's combined card values
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

soft_hand = {
    # Dealer card =>
    2 => {
        # Suggestion => Player's combined card values
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

pair_hand = {
    # Dealer card =>
    2 => {
        # Suggestion => Player's pairs
        "P" => [ [2,2], [3,3], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "H" => [ [4,4] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    3 => {
        "P" => [ [2,2], [3,3], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "H" => [ [4,4] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    4 => {
        "P" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    5 => {
        "P" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    6 => {
        "P" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    7 => {
        "P" => [ [2,2], [3,3], [6,6], [7,7], [8,8], ["A","A"] ],
        "H" => [ [4,4] ],
        "Dh" => [ [5,5] ],
        "S" => [ [9,9], [10,10] ]
    },
    8 => {
        "P" => [ [3,3], [7,7], [8,8], [9,9], ["A","A"] ],
        "H" => [ [2,2], [4,4], [6,6] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10, 10] ]
    },
    9 => {
        "P" => [ [8,8], [9,9], ["A","A"] ],
        "H" => [ [2,2], [3,3], [4,4], [6,6], [7,7] ],
        "Dh" => [ [5,5] ],
        "S" => [ [10,10] ]
    },
    10 => {
        "P" => [ [8,8], ["A","A"] ],
        "H" => [ [2,2], [3,3], [4,4], [5,5], [6,6] ],
        "S" => [ [7,7], [9,9], [10,10] ]
    },
    "A" => {
        "P" => [ [8,8], ["A","A"] ],
        "H" => [ [2,2], [3,3], [4,4], [5,5], [6,6], [7,7] ],
        "S" => [ [9,9], [10,10] ]
    }
}

#-----------------

first = first_card
second = second_card
dealer = dealer_card

puts "First card: #{first}\nSecond card: #{second}\nDealer card: #{dealer}"
cardset = first.to_i + second.to_i
puts "Cardset: #{cardset}"

if first == second
    pair = []
    pair.push(first.to_i, second.to_i) # >> only accepts one value

    pair_hand[first.to_i].each do |key, value|
        value.each do |thing|
             if pair == thing
                 puts "You have a pair! Suggestion: #{key}"
             end
        end
    end
end
