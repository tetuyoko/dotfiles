#                 ██      
#                ░██      
#  ██████  ██████░██      
# ░░░░██  ██░░░░ ░██████  
#    ██  ░░█████ ░██░░░██ 
#   ██    ░░░░░██░██  ░██ 
#  ██████ ██████ ░██  ░██ 
# ░░░░░░ ░░░░░░  ░░   ░░  
#
#█▓▒░ env

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin

export V_TARGET_ID="android-16"
export IPHONE_SIM=~/Library/Application\ Support/iPhone\ Simulator

export COCOS_CONSOLE_ROOT=/Users/yokoyama_tetsuro/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.3/libexec/bin
export PATH=$ANT_ROOT:$PATH

# Android dev environment for MacOS
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export ANDROID_HOME=/opt/adt-bundle-mac-x86_64/sdk
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e
export PATH=${ANDROID_NDK_ROOT}:$PATH
export PATH=${ANDROID_HOME}/platform-tools:$PATH
export PATH=${ANDROID_HOME}/tools:$PATH

export NDK_ROOT=${ANDROID_NDK_ROOT} 
export NDK_CCACHE=`which ccache`
export ANDROID_SDK_ROOT=${ANDROID_HOME}

#█▓▒░  golang
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export MGNCV=/Users/tetuyoko/gocode/src/mgncvtr

## LANG
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8