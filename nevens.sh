#!/ usr/ bin/ env bash
# File: nevens.sh 
source isiteven.sh
function nEvens {
local count=0
for element in $@ 
do
	isEven=$(isItEven $element)
	if [[ 1 -eq $isEven ]]  
	then
		let count=count+1
	fi
done
echo $count
}
