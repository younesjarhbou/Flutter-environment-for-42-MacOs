# Load Homebrew config script
source $HOME/.brewconfig.zsh

alias cclean='bash ~/Cleaner_42.sh'


cd ~/goinfre/
export PATH="$PATH:`pwd`/flutter/bin"
export JAVA_HOME=/Users/yjarhbou/goinfre/javaJDK/Contents/Home

export PATH=$PATH:/Users/yjarhbou/goinfre/sdk/platform-tools


if [ ! -f ~/goinfre/flutter/bin/flutter ]; then
    rm -rf ~/goinfre/flutter
    echo "Creating Flutter Folder in GoinFree";
    curl -LJ https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.7.8-stable.zip -o ~/goinfre/flutter.zip && \
    unzip -q ~/goinfre/flutter.zip -d ~/goinfre
    mv ~/goinfre/flutter-master ~/goinfre/flutter&
    #rm file.zip
fi

if [ ! -d ~/goinfre/javaJDK/Contents/Home/bin ]; then
   echo "Creating Java Folder in GoinFree";
    rm -rf javaJDK
    if [ ! -f ~/goinfre/javaJDK.zip ]; then
        curl --progress-bar -LJ https://download.oracle.com/java/17/latest/jdk-17_macos-x64_bin.tar.gz -o ~/goinfre/javaJDK.zip && \
        unzip -q ~/goinfre/javaJDK.zip -d ~/goinfre
        mv ~/goinfre/jdk-master ~/goinfre/javaJDK&
    fi
    #rm file.zip
    #flutter config --android-studio-dir /goinfre/yjarhbou/sdk
fi

	if [ ! -d ~/goinfre/sdk ]; then
    	echo Create sdk folder
        mkdir sdk
    fi
    flutter config --android-studio-dir ~/goinfre/sdk
    #flutter config --android-studio-dir sdk
	#sdk --install "cmdline-tools;latest"
    #flutter doctor --android-licenses
	flutter config --android-studio-dir=/Applications/Android\ Studio.app


	ln -s ~/goinfre/.brew ~

	if [ -L ~/Library/Caches/Google ]; then
    echo "Symbolic link already exists"
	else
	echo "Creating Google Folder in GoinFree";
    mkdir ~/goinfre/Google
    ln -s ~/goinfre/Google/ ~/Library/Caches
	fi


	# Check if Dart is installed and get the current version
dart_version=$(dart --version 2>&1)
desired_version="2.19.5"

# Function to install Dart using Homebrew
install_dart_with_brew() {
    echo "Dart $desired_version not found. Installing with Homebrew..."
    brew install dart
}

# Compare the current version with the desired version
if [[ $dart_version == *"$desired_version"* ]]; then
    echo "Dart $desired_version is already installed."
else
    install_dart_with_brew
fi

#zsh ~/Desktop/flutterScript.bash
alias code="open -a Visual\ Studio\ Code"
    flutter doctor
cd -

function brew {
    local green="\033[0;32m"
    local reset="\033[0m"
    local brew_url="https://github.com/Homebrew/brew/tarball/master"

    if [ ! -f "/goinfre/$USER/homebrew/bin/brew" ]; then
        echo "${green}Instaling brew...${reset}"
        mkdir -p /goinfre/$USER/homebrew
        curl --silent -L $brew_url | tar xz --strip 1 -C /goinfre/$USER/homebrew
    fi
    /goinfre/$USER/homebrew/bin/brew $@
    return $?
}
