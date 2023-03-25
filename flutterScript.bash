# java home
cd goinfre/
export PATH="$PATH:`pwd`/flutter/bin"
export JAVA_HOME=~/goinfre/javaJDK/Contents/Home



if [ ! -f ~/goinfre/flutter/bin/flutter ]; then
    rm -rf ~/goinfre/flutter
    echo "Creating Flutter Folder in GoinFree";
    curl --progress-bar -sSLJ https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.7.8-stable.zip -o ~/goinfre/flutter.zip && \
    unzip -q ~/goinfre/flutter.zip -d ~/goinfre
    mv ~/goinfre/flutter-master ~/goinfre/flutter&
    #rm file.zip
fi

if [ ! -d ~/goinfre/javaJDK/bin ]; then
   echo "Creating Java Folder in GoinFree";
    rm -rf javaJDK
    if [ ! -f ~/goinfre/javaJDK.zip ]; then
        curl --progress-bar -LJ https://github.com/openjdk/jdk/archive/refs/heads/master.zip -o ~/goinfre/javaJDK.zip && \
        unzip -q ~/goinfre/javaJDK.zip -d ~/goinfre
        
        mv ~/goinfre/jdk-master ~/goinfre/javaJDK&
    fi
    #rm file.zip
    #flutter config --android-studio-dir /goinfre/yjarhbou/sdk
fi

    if [ ! -d ~/goinfre/sdk ]; then
    
        mkdir sdk
    fi
    #~/goinfre/sdk --install "cmdline-tools;latest"
    #flutter config --android-studio-dir ~/goinfre/sdk
    export ANDROID_HOME ~/goinfre/sdk
    export PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

    flutter config --android-sdk sdk
    sdk --install "cmdline-tools;latest"
    flutter doctor
    
    echo "Creating Google Folder in GoinFree";
    mkdir ~/goinfre/Google
    ln -s ~/goinfre/Google/ ~/Library/Caches

