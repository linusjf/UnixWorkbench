{
    for (i=1; i<=NF; i++) {
        field = $i
        if (field ~ word) {
            c = index($0, field)
            print NR "," c, $0
            next
        }
    }
}
