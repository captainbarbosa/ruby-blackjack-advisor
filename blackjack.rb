#TODO: Fix case where user has a pair of aces

# Method for getting a card value within accepted range
def get_card

    input = gets.upcase.chomp

    if input == "J" || input == "K" || input == "Q"
        input = 10
        return input
    elsif input == "A"
        input = 11
        return input
    elsif
        input.to_i > 1 && input.to_i < 10
        return input
    else
        puts "Please enter a valid card:"
        # RECURSION!
        input = get_card
    end
end


#-----------------

# Blackjack strategy data structures

hard_hand = {
    # Dealer card =>
    2 => {
        # Suggestion => Player's combined card values
        "Hit" => [5, 6, 7, 8, 12],
        "Double if possible, otherwise hit"=> [9, 10, 11],
        "Stand" => [13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    3 => {
        "Hit" => [5, 6, 7, 8, 12],
        "Double if possible, otherwise hit"=> [9, 10, 11],
        "Stand" => [13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    4 => {
        "Hit" => [5, 6, 7, 8],
        "Double if possible, otherwise hit"=> [9, 10, 11],
        "Stand" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    5 => {
        "Hit" => [5, 6, 7],
        "Double if possible, otherwise hit" => [8, 9, 10, 11],
        "Stand" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
    },
    6 => {
        "Hit" => [5, 6, 7],
        "Double if possible, otherwise hit" => [8, 9, 10, 11],
        "Stand" => [12, 13, 14, 15, 16, 17, 18, 19, 20, 21]
    },
    7 => {
        "Hit" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [10, 11],
        "Stand" => [17, 18, 19, 20, 21]
    },
    8 => {
        "Hit" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [10, 11],
        "Stand" => [17, 18, 19, 20, 21]
    },
    9 => {
        "Hit" => [5, 6, 7, 8, 9, 12, 13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [10, 11],
        "Stand" => [17, 18, 19, 20, 21]
    },
    10 => {
        "Hit" => [5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [11],
        "Stand" => [17, 18, 19, 20, 21]
    },
    "A" => {
        "Hit" => [5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [11],
        "Stand" => [17, 18, 19, 20, 21]
    }
}

soft_hand = { # if hand contains an ace
    # Dealer card =>
    2 => {
        # Suggestion => Player's combined card values
        "Hit" => [13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [17],
        "Stand" => [18, 19, 20, 21]
    },
    3 => {
        "Hit" => [13, 14, 15, 16],
        "Double if possible, otherwise hit"=> [17],
        "Double if possible, otherwise stand" => [18],
        "Stand" => [19, 20, 21]
    },
    4 => {
        "Double if possible, otherwise hit"=> [13, 14, 15, 16, 17],
        "Double if possible, otherwise stand" => [18],
        "Stand" => [19, 20, 21]
    },
    5 => {
        "Double if possible, otherwise hit"=> [13, 14, 15, 16, 17],
        "Double if possible, otherwise stand" => [18],
        "Stand" => [19, 20, 21]
    },
    6 => {
        "Double if possible, otherwise hit"=> [13, 14, 15, 16, 17],
        "Double if possible, otherwise stand" => [18, 19],
        "Stand" => [20, 21]
    },
    7 => {
        "Hit" => [13, 14, 15, 16, 17],
        "Stand" => [18, 19, 20, 21]
    },
    8 => {
        "Hit" => [13, 14, 15, 16, 17],
        "Stand" => [18, 19, 20, 21]
    },
    9 => {
        "Hit" => [13, 14, 15, 16, 17, 18],
        "Stand" => [19, 20, 21]
    },
    10 => {
        "Hit" => [13, 14, 15, 16, 17, 18],
        "Stand" => [19, 20, 21]
    },
    "A" => {
        "Hit" => [13, 14, 15, 16, 17],
        "Stand" => [18, 19, 20, 21]
    }
}

pair_hand = {
    # Dealer card =>
    2 => {
        # Suggestion => Player's pairs
        "Split" => [ [2,2], [3,3], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Hit" => [ [4,4] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    3 => {
        "Split" => [ [2,2], [3,3], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Hit" => [ [4,4] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    4 => {
        "Split" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    5 => {
        "Split" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    6 => {
        "Split" => [ [2,2], [3,3], [4,4], [6,6], [7,7], [8,8], [9,9], ["A","A"] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    7 => {
        "Split" => [ [2,2], [3,3], [6,6], [7,7], [8,8], ["A","A"] ],
        "Hit" => [ [4,4] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [9,9], [10,10] ]
    },
    8 => {
        "Split" => [ [3,3], [7,7], [8,8], [9,9], ["A","A"] ],
        "Hit" => [ [2,2], [4,4], [6,6] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10, 10] ]
    },
    9 => {
        "Split" => [ [8,8], [9,9], ["A","A"] ],
        "Hit" => [ [2,2], [3,3], [4,4], [6,6], [7,7] ],
        "Double if possible, otherwise hit" => [ [5,5] ],
        "Stand" => [ [10,10] ]
    },
    10 => {
        "Split" => [ [8,8], ["A","A"] ],
        "Hit" => [ [2,2], [3,3], [4,4], [5,5], [6,6] ],
        "Stand" => [ [7,7], [9,9], [10,10] ]
    },
    "A" => {
        "Split" => [ [8,8], ["A","A"] ],
        "Hit" => [ [2,2], [3,3], [4,4], [5,5], [6,6], [7,7] ],
        "Stand" => [ [9,9], [10,10] ]
    }
}

#-----------------

puts "Enter your first card:"
first = get_card

puts "Enter your second card:"
second = get_card

puts "Enter your dealer card:"
dealer = get_card

puts "First card: #{first}\nSecond card: #{second}\nDealer card: #{dealer}"
cardset = first.to_i + second.to_i
puts "Cardset: #{cardset}"

# Pair hand suggestion
if first == second
    pair = []
    pair.push(first.to_i, second.to_i) # >> only accepts one value

    pair_hand[dealer.to_i].each do |key, value|
        value.each do |thing|
             if pair == thing
                 puts "You have a pair! Suggestion: #{key}"
             end
        end
    end

# Hard hand suggestion
elsif
    first.to_i < 11 && second.to_i < 11
    hard_hand[dealer.to_i].each do |key, value|
        value.each do |thing|
            if cardset == thing
                puts "Suggestion for strong hand: #{key}"
            end
        end
    end

# Soft hand suggestion
elsif
    first == 11 || second == 11
    puts "You have an ace"
    soft_hand[dealer.to_i].each do |key, value|
        value.each do |thing|
            if cardset == thing
                puts "Suggestion for soft hand: #{key}"
            end
        end
    end
end

puts "May the odds be ever in your favor."
