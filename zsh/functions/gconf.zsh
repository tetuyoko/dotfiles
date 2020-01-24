function gconf() {
  projData=$(gcloud config configurations list | peco)
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}

    echo "=== The current account is as follows ==="
    gcloud config configurations list | grep "${config}"
    cluster=$(kubectl config get-clusters | grep "${config}")
    if [ -n "${cluster}" ]; then; kubectl config use-context "${cluster}"; fi
  fi
}
zle -N gconf
