# BaSH-ftp
the purpose of this script is to automate the process of downloading images from an ftp server

Server specifications:
The FTP server is currently an AWS instance running vsftpd on ubuntu 16.04. Private keys to SSH into the server can be found where they are located. 
The AWS instance is on the free tier for all specefications including ram, disk space, and network usage. For testing and the projected use, this will suffice. 

Server use:
the ftp aws instance needs to be launched prior to use to have the new images uploaded to it. This can be done via whatever ftp client you prefer. 
Credentials for the ftp account on the server can be found where they are found. 
After all required images have been downloaded, be sure to STOP the aws instance to avoid additional charges. Never under any circumstance should you TERMINATE the aws instance when changing raspberry pi images. Doing so results in the complete deletion of the instance.

Raspberry pi use:
ssh into the raspberry pis, run the script and follow the prompts that the script gives. 
once all images have been downloaded, make sure to issue the 'sudo reboot' command in order for the changes to be reflected on the displays

