#!bin/bash

#install needed package
#sudo pacman -S jdk17-openjdk gnome-terminal wget

#install docker binaries
# not clear how binaries run
DIR_HOME=$(echo ~)
USR_BIN="/usr/bin/docker"
DOCKER_BINARIES_FILE="docker-23.0.4.tgz"
DOCKER_FOLDER=$DIR_HOME/Downloads/docker

if [ ! -d $USR_BIN ]; then  #check usr/bin is exist docker
	echo "FILE NOT EXIST" &&
	if [ -f $DOCKER_BINARIES_FILE ]; then #check is downloaded file
		echo "FILE EXIST" &&
		if [ -d $DOCKER_FOLDER ]; then #check is extracted file
			echo "FILE EXIST GO COPY TO /user/bin" &&
			
			#cp -r equals --recursive, read more at: https://pubs.opengroup.org/onlinepubs/009695399/utilities/cp.html
			#Recursive means that cp copies the contents of directories, and if a directory has subdirectories they are copied (recursively) too
			sudo cp -r $DOCKER_FOLDER /usr/bin/ 
			sudo dockerd &
		else
			echo "FILE NOT EXIST GO TAR FILE"
			cd $DIR_HOME
			tar -xvzf $DOCKER_BINARIES_FILE 
			sudo cp -r $DOCKER_FOLDER /usr/bin/
			sudo dockerd &
		fi		
	else
		echo "ERROR: no file docker binaries "
		wget -P ~/Downloads "https://download.docker.com/linux/static/stable/x86_64/docker-23.0.4.tgz"
		cd $DIR_HOME/Downloads
		tar -xvzf $DOCKER_BINARIES_FILE 
		sudo cp -r $DOCKER_FOLDER /usr/bin/ 
		sudo dockerd &
	fi
fi

# install dokcer desktop
wget -P ~/Downloads https://desktop.docker.com/linux/main/amd64/docker-desktop-4.18.0-x86_64.pkg.tar.zst
sudo pacman -U ~/Downloads/docker-desktop-4.18.0-x86_64.pkg.tar.zst
