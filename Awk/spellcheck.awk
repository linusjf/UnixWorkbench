BEGIN {
    count = 0
    i = 0
    while (getline myword <"/usr/share/dict/words") {
        dict[i] = myword
        i++
    }
}

{
    for (i=1; i<=NF; i++) {
        field = $i
        if (match(field, /[[:punct:]]$/)) {
            field = substr(field, 0, RSTART-1)
        }
        mywords[count] = field
        count++
    }
}

END {
    for (w_i in mywords) { 
        for (w_j in dict) { 
            if (mywords[w_i] == dict[w_j] || 
                        tolower(mywords[w_i]) == dict[w_j]) {
                delete mywords[w_i]
            }
        }
    }

    for (w_i in mywords) { 
        if (mywords[w_i] != "") {
            print mywords[w_i]        
        }
    }
}
