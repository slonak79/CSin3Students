#!/bin/bash

setupMac() {
	which -s brew;

	if [[ $? != 0 ]] ; then
		echo "Install brew"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	echo "Updating brew...";
	brew update -v
	echo "Running brew doctor";
	brew doctor -v
	echo "Installing node...";
	brew install node
	echo "Installing mongodb...";
	brew install mongodb
	echo "You're all done! Run npm run bootstrap to setup your mongo";
}
        

if [ "$(uname)" == "Darwin" ]; then
    echo 'Hello Mac User ;)';
    setupMac;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo 'Hello Linux user :)';
fi

