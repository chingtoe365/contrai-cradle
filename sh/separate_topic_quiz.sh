# !/usr/bin/bash
# CONTRACT_DIR="/home/vagrant/sync/testfield/contracts"
# TOPICS=$(cat topic.py | awk '{print $0}')
while IFS= read -r line
do 
	# echo "111"
	spacecount=$(echo $line | grep -c " ")
	echo $spacecount
	# if [ $spacecount -eq 0 ]
	# then
	# 	topic=$(echo $line)
	# else
	# 	topic=$(echo "\"$line\"")
	# fi
	# echo "Training and testing on topic $topic ..."
	# echo "python orchestration.py --action \"train-test\" --training-id \"143\" --topic \"$line\""
	cd ~/sync/testfield/ &&
	python orchestration.py --action "train-test" --training-id "$1" --topic "$line"
done < topic.py
# for topic in $TOPICS;
# do
	
# done