#!bin/bash

#defining a variables to be used in later commands, adds more autonomy

echo 'do you need to take down any picutres?(y/n)'
read ANS

#taking down any of the old/dated displayes defined by the user by removing them from the directory the pi pulls them from. 
#NOTE: the script is not very smart, and only reads the character 'y', any other input will cause it to exit the loop. 
while [ $ANS == 'y' ]
do
	#the purpose of the below ls command is to show what pictures are currently in the directory. in order to delete a picture 
	#you have to type its name and extension exactly as it is written in the output from the command
	ls /usr/lib/rs/imgs/
	echo 'what is the name of the picture that you want to take down?'
	read OLDPIC
	sudo rm /usr/lib/rs/imgs/$OLDPIC
	echo 'do you need to take down another picture?(y/n)'
	#NOTE: the script is not very smart, and only reads the character 'y', any other input will cause it to exit the loop. 
	read ANS
done

#credentials for the ftp server
USER='XXX'
PASSWD='XXX'
#no longer need to ask the user for host information as the server has an elastic ip
HOST='XXX.XXX.XXX.XXX'

#repeat process for downloading more than one picture without needing to run the script multiple times
echo 'do you need to download another picutre?(y/n)'
read ANS2
#NOTE: the script is not very smart, and only reads the character 'y', any other input will cause it to exit the loop. 
while [ $ANS2 == 'y' ]
do
	#the purpose of the bellow ftp connection command is to ls its contents
	lftp -u $USER,$PASSWD $HOST << EOT
	set ssl:verify-certificate no #need to fix this
	ls
	bye
EOT
	#to download a file you have to type its name and extension exactly as it is written in the output of the above ls command
	echo 'what is the name of the picure that you want to download?'
	read PICTUREREPEAT
	lftp -u $USER,$PASSWD $HOST << EOT
	set ssl:verify-certificate no #need to fix this
	get $PICTUREREPEAT
	bye
EOT
	sudo mv $PICTUREREPEAT /usr/lib/rs/imgs
	echo 'do you need to download another picutre?(y/n)'
	#NOTE: the script is not very smart, and only reads the character 'y', any other input will cause it to exit the loop. 
	read ANS2
done

#confirming that the script is done running. 
echo 'all done.'
