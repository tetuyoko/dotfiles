#█▓▒░ env
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin
# `yarn global bin`
export PATH=$PATH:/usr/local/Cellar/node/9.5.0/bin

export V_TARGET_ID="android-16"
export IPHONE_SIM=~/Library/Application\ Support/iPhone\ Simulator

export COCOS_CONSOLE_ROOT=/Users/yokoyama_tetsuro/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.3/libexec/bin
export PATH=$ANT_ROOT:$PATH
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/usr/bin

# Android dev environment for MacOS
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e

# React-Native
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Android
#export ANDROID_HOME=/opt/adt-bundle-mac-x86_64/sdk
#export PATH=${ANDROID_NDK_ROOT}:$PATH
#export PATH=${ANDROID_HOME}/platform-tools:$PATH
#export PATH=${ANDROID_HOME}/tools:$PATH

export NDK_ROOT=${ANDROID_NDK_ROOT} 
export NDK_CCACHE=`which ccache`
export ANDROID_SDK_ROOT=${ANDROID_HOME}

#█▓▒░  golang
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export MGNCV=/Users/tetuyoko/gocode/src/mgncvtr

#█▓▒░  react
export REACT_EDITOR=atom

#█▓▒░  rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

#█▓▒░  tensorflow
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export TENSOR_PATH="/usr/local/var/pyenv/versions/3.5.2/lib/python3.5/site-packages/tensorflow"

# Aws Session Manager Plugin
export PATH=$PATH:/usr/local/sessionmanagerplugin/bin

export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"

## LANG
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8
