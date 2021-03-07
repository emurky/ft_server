#!/bin/bash

# Script must be executed with "source" command
# source autoindex.sh

if [ "$AUTOINDEX" == "off" ]
then
{
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/localhost
	export AUTOINDEX="on"
	echo "Autoindex was switched ON"
}
elif [ "$AUTOINDEX" == "on" ]
then
{
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/localhost
	export AUTOINDEX="off"
	echo "Autoindex was switched OFF"
}
else
	echo "Autoindex was set to a bad value, please change it to \"on\" or \"off\""
fi

service nginx reload
