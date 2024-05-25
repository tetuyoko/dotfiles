## Env
#
## Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin

## Rust
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"

## Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

## dotnet
export PATH="$PATH:$HOME/.dotnet/tools"

## Python
export PATH="/usr/local/opt/python@3.12/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

### Tensorflow
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

## JavaScript
### yarn
export PATH="$HOME/.yarn/bin:$PATH"

### Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## GCP
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json

## AWS
### Session Manager Plugin
export PATH=$PATH:/usr/local/sessionmanagerplugin/bin

## MySQL
export LDFLAGS="-L/usr/local/opt/mysql@8.0/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@8.0/lib/pkgconfig"
export PATH="/usr/local/opt/mysql@8.0/bin:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

## k8s
export PATH="$PATH:$HOME/.kube/plugins/jordanwilson230"


export DEPLOY_KEY=$(cat ~/.ssh/github/id_rsa | base64)
export TERM=xterm-256color

## LANG
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8
