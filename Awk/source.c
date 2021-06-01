1  #include <stdio.h>
2
3  int main(void) {
4
5      char *countries[5] = { "Germany", "Slovakia", "Poland", 
6              "China", "Hungary" };
7    
8      size_t len = sizeof(countries) / sizeof(*countries);
9    
10     for (size_t i=0; i < len; i++) {
11        
12         printf("%s\n", countries[i]);
13     }
14 }
