# Envs.
#
#

## Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin

## Rust
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

## Go
export GOPATH=$HOME/gocode
export GOROOT=/usr/local/Cellar/go/1.17.5/libexec/
export PATH=$PATH:$GOPATH/bin
export MGNCV=/Users/tetuyoko/gocode/src/mgncvtr
export GOPRIVATE=github.com/zeals-co-ltd/protobuf

## Python
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
#export PATH="$HOME/.pyenv/shims:${PATH}"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

## Tensorflow
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"
#export TENSOR_PATH="/usr/local/var/pyenv/versions/3.5.2/lib/python3.5/site-packages/tensorflow"

## JavaScript
export PATH="$HOME/.yarn/bin:$PATH"

# Cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/yokoyama_tetsuro/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
export ANT_ROOT=/usr/local/Cellar/ant/1.9.3/libexec/bin
export PATH=$ANT_ROOT:$PATH
export PATH=$PATH:/usr/sbin/:/usr/local/bin:/usr/bin

## Android
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_NDK_ROOT=/opt/android-ndk-r8e
export V_TARGET_ID="android-16"
export IPHONE_SIM=~/Library/Application\ Support/iPhone\ Simulator

## React-Native
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export NDK_ROOT=${ANDROID_NDK_ROOT} 
export NDK_CCACHE=`which ccache`
export ANDROID_SDK_ROOT=${ANDROID_HOME}

## GCP
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json

## AWS
### Session Manager Plugin
export PATH=$PATH:/usr/local/sessionmanagerplugin/bin

## MySQL
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$PATH:~/.kube/plugins/jordanwilson230"

export DEPLOY_KEY=$(cat ~/.ssh/github/id_rsa | base64)
export TERM=xterm-256color

## LANG
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8
