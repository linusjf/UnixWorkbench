BEGIN {

    FS=","
    max = 0
    min = 10**10
    sum = 0
    avg = 0
} 

{ 
    for (i=1; i<=NF; i++) { 
    
        sum += $i
    
        if (max < $i) {
            max = $i
        }
        
        if (min > $i) {
            min = $i
        }
    
        printf("%d ",  $i) 
    }
}

END {
    
    avg = sum / NF
    printf("\n")
    printf("Min: %d, Max: %d, Sum: %d, Average: %d\n", min, max, sum, avg)
}
