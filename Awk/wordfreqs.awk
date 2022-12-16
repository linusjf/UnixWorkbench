#!/usr/bin/env -S awk -f
# Print list of word frequencies
{
# remove case distinctions
$0 = tolower($0) 
# remove punctuation
gsub(/[^a-z0-9_ \t]/, "", $0) 
for (i = 1; i <= NF; i++)
freq[$i]++
}
END {
sort = "sort +1 -nr"
for (word in freq)
printf "%s\t%d\n", word, freq[word] | sort
close(sort)
}
