# This program creates a rock-paper-scissors game.
BEGIN {
    srand()
    
    opts[1] = "rock"
    opts[2] = "paper"
    opts[3] = "scissors"

    do {
        print "1 - rock"
        print "2 - paper"
        print "3 - scissors"
        print "9 - end game"
        
        ret = getline < "-"

        if (ret == 0 || ret == -1) {
            exit
        }
        
        val = $0
        
        if (val == 9) {
            exit
        } else if (val != 1 && val != 2 && val != 3) {
            print "Invalid option"
            continue
        } else {
            play_game(val)
        }
    } while (1)
}

function play_game(val) {
    r = int(rand()*3) + 1

    print "I have " opts[r] " you have "  opts[val]
    
    if (val == r) {
        print "Tie, next throw"
        return
    }
    
    if (val == 1 && r == 2) {
        print "Paper covers rock, you lose"
    } else if (val == 2 && r == 1) {
        print "Paper covers rock, you win"
    } else if (val == 2 && r == 3) {
        print "Scissors cut paper, you lose"
    } else if (val == 3 && r == 2) {
        print "Scissors cut paper, you win"
    } else if (val == 3 && r == 1) {
        print "Rock blunts scissors, you lose"
    } else if (val == 1 && r == 3) {
        print "Rock blunts scissors, you win"
    } 
}
