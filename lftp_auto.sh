#!bin/bash

#defining variables to be used in later commands, adds more autonomy
echo 'what is the ip of the server?'
read HOST

echo 'do you need to take down any picutres?(y/n)'
read ANS

#taking down any of the old/dated displayes defined by the user
while [ $ANS == 'y' ]
do 
	echo 'what is the name of the picture that you want to take down?'
	read OLDPIC
	sudo rm /usr/lib/rs/imgs/$OLDPIC
	echo 'do you need to take down another picture?(y/n)'
	read ANS
done

#credentials for the ftp server
USER='XXX'
PASSWD='XXX'

#repeat process for downloading more than one picture without needing to run the script multiple times
echo 'do you need to download another picutre?(y/n)'
read ANS2
while [ $ANS2 == 'y' ]
do 
	echo 'what is the name of the picure that you want to download?'
	read PICTUREREPEAT
	lftp -u $USER,$PASSWD $HOST << EOT
	set ssl:verify-certificate no
	get $PICTUREREPEAT
	bye
EOT
	sudo mv $PICTUREREPEAT /usr/lib/rs/imgs
	echo 'do you need to download another picutre?(y/n)'
	read ANS2
done

echo 'all done.'

#I have done some research into a few different ways that we can make this a little more secure.
#we can try and have the password stored in a different file
#we can try and make the script executable from a different user but not readable. 
#we can have the person using the script enter in the credentials as the script is ran
