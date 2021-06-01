# the program adds tags around Java keywords
# it works on keywords that are separate words

BEGIN {
    # load java keywords
    i = 0
    while (getline kwd <"javakeywords.txt") {
        keywords[i] = kwd
        i++
    }
}

{
    mtch = 0
    ln = ""
    space = ""
    
    # calculate the beginning space
    if (match($0, /[^[:space:]]/)) {
        if (RSTART > 1) {
            space = sprintf("%*s", RSTART, "") 
        }
    }     
    
    # add the space to the line
    ln = ln space
    
    for (i=1; i <= NF; i++) {
        field = $i
         
        # go through keywords   
        for (w_i in keywords) { 
            kwd = keywords[w_i]
            
            # check if a field is a keyword
            if (field == kwd) {
                mtch = 1     
            } 
        }
        
        # add tags to the line        
        if (mtch == 1) {
            ln = ln  "<kwd>" field  "</kwd> "   
        } else {
            ln = ln field " " 
        }
        mtch = 0
    }
    print ln
}
